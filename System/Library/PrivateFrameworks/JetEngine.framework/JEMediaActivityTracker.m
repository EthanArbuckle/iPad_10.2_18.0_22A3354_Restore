@implementation JEMediaActivityTracker

- (JEMediaActivityTracker)initWithPipeline:(id)a3 playlist:(id)a4 eventData:(id)a5 topic:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  JEMediaActivityTracker *v14;
  JEMediaActivityTracker *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)JEMediaActivityTracker;
  v14 = -[JEMediaActivityTracker init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    -[JEMediaActivityTracker setTopic:](v14, "setTopic:", v13);
    -[JEMediaActivityTracker setPipeline:](v15, "setPipeline:", v10);
    -[JEMediaActivityTracker setPlaylist:](v15, "setPlaylist:", v11);
    v16 = (void *)objc_msgSend(v12, "mutableCopy");
    -[JEMediaActivityTracker setEventData:](v15, "setEventData:", v16);

    -[JEMediaActivityTracker setShouldGenerateTransitions:](v15, "setShouldGenerateTransitions:", 1);
  }

  return v15;
}

- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v10;
  JEMediaTimeTracker *v11;
  double v12;
  JEMediaTimeTracker *v13;

  v10 = -[JEMediaActivityTracker startActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "startActivity:overallPosition:type:reason:eventData:transitioningEventData:", 0, a4, a5, a6, a7, 0);
  if (-[JEMediaActivityTracker shouldGenerateTransitions](self, "shouldGenerateTransitions"))
  {
    v11 = [JEMediaTimeTracker alloc];
    *(float *)&v12 = a3;
    v13 = -[JEMediaTimeTracker initWithPosition:playbackRate:](v11, "initWithPosition:playbackRate:", a4, v12);
    -[JEMediaActivityTracker setTimeTracker:](self, "setTimeTracker:", v13);

  }
}

- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  double v6;

  LODWORD(v6) = 1.0;
  -[JEMediaActivityTracker playStartedWithPlaybackRate:overallPosition:type:reason:eventData:](self, "playStartedWithPlaybackRate:overallPosition:type:reason:eventData:", a3, a4, a5, a6, v6);
}

- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[JEMediaActivityTracker generatePlaylistTransitionsIfNecessary:](self, "generatePlaylistTransitionsIfNecessary:", a3);
  -[JEMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "stopActivity:overallPosition:type:reason:eventData:transitioningEventData:", 0, a3, v12, v11, v10, 0);

  -[JEMediaActivityTracker setTimeTracker:](self, "setTimeTracker:", 0);
}

- (void)playTransitionedAtOverallPosition:(unint64_t)a3 eventData:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  -[JEMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "stopActivity:overallPosition:type:reason:eventData:transitioningEventData:", 0, a3, CFSTR("automatic"), CFSTR("transition"), v7, 0);
  v6 = -[JEMediaActivityTracker startActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "startActivity:overallPosition:type:reason:eventData:transitioningEventData:", 0, a3, CFSTR("automatic"), CFSTR("transition"), v7, 0);

}

- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v6;

  v6 = -[JEMediaActivityTracker startActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "startActivity:overallPosition:type:reason:eventData:transitioningEventData:", 1, a3, a4, a5, a6, 0);
}

- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  -[JEMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "stopActivity:overallPosition:type:reason:eventData:transitioningEventData:", 1, a3, a4, a5, a6, 0);
}

- (void)synchronizePlaybackRate:(float)a3 overallPosition:(unint64_t)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t *v11;
  int v12;
  void *v13;
  double v14;
  char v15;
  __int16 v16;
  __int16 v17;

  -[JEMediaActivityTracker playActivity](self, "playActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && !objc_msgSend(v7, "type"))
  {
    v9 = a3 <= 0.0;
    v12 = objc_msgSend(v8, "isStopped");
    if ((v12 & 1) == 0 && a3 > 0.0)
    {
      -[JEMediaActivityTracker generatePlaylistTransitionsIfNecessary:](self, "generatePlaylistTransitionsIfNecessary:", a4);
      -[JEMediaActivityTracker timeTracker](self, "timeTracker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v14 = a3;
      objc_msgSend(v13, "updatePosition:playbackRate:", a4, v14);

      goto LABEL_9;
    }
    if (a3 > 0.0)
      v15 = 1;
    else
      v15 = v12;
    if ((v15 & 1) == 0)
    {
      JEMetricsOSLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v17 = 0;
      v11 = (uint8_t *)&v17;
      goto LABEL_7;
    }
    if (((v12 ^ 1) & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v9 = a3 <= 0.0;
  }
  if (!v9)
  {
    JEMetricsOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

      goto LABEL_9;
    }
    v16 = 0;
    v11 = (uint8_t *)&v16;
LABEL_7:
    _os_log_impl(&dword_19CCBB000, v10, OS_LOG_TYPE_ERROR, "JetEngine: Inconsistent state: did you forget to call playStopped?", v11, 2u);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)synchronizeAtOverallPosition:(unint64_t)a3
{
  id v5;

  -[JEMediaActivityTracker timeTracker](self, "timeTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackRate");
  -[JEMediaActivityTracker synchronizePlaybackRate:overallPosition:](self, "synchronizePlaybackRate:overallPosition:", a3);

}

- (void)updateEventData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[JEMediaActivityTracker eventData](self, "eventData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (void)resetEventData:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *eventData;

  if (a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  eventData = self->_eventData;
  self->_eventData = v4;

}

- (NSMutableArray)eventData
{
  NSMutableArray *eventData;
  NSMutableArray *v4;
  NSMutableArray *v5;

  eventData = self->_eventData;
  if (!eventData)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_eventData;
    self->_eventData = v4;

    eventData = self->_eventData;
  }
  return eventData;
}

- (id)combineEventData:(id)a3 withPlaylistDataForItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEMediaActivityTracker playlist](self, "playlist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[JEMediaActivityTracker playlist](self, "playlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v12 = 0;
    if (!v11)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v7, "eventData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
LABEL_8:
    objc_msgSend(v8, "addObjectsFromArray:", v11);
LABEL_9:
  if (v12)
    objc_msgSend(v8, "addObjectsFromArray:", v12);
  -[JEMediaActivityTracker eventData](self, "eventData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v13);

  if (v6)
    objc_msgSend(v8, "addObjectsFromArray:", v6);
  v14 = (void *)objc_msgSend(v8, "copy");

  return v14;
}

- (id)startActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7 transitioningEventData:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  JEMediaActivity *v19;
  void *v20;
  void *v21;
  JEMediaActivity *v22;
  void *v23;
  id v25;

  v25 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  -[JEMediaActivityTracker playlist](self, "playlist");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "itemAtOverallPosition:rangeOptions:", a4, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = [JEMediaActivity alloc];
  -[JEMediaActivityTracker pipeline](self, "pipeline");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[JEMediaActivityTracker topic](self, "topic");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[JEMediaActivity initWithType:playlistItem:pipeline:topic:](v19, "initWithType:playlistItem:pipeline:topic:", a3, v18, v20, v21);

  -[JEMediaActivityTracker combineEventData:withPlaylistDataForItem:](self, "combineEventData:withPlaylistDataForItem:", v14, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[JEMediaActivity startedAtOverallPosition:type:reason:eventData:transitioningEventData:](v22, "startedAtOverallPosition:type:reason:eventData:transitioningEventData:", a4, v16, v15, v23, v25);
  if (a3 == 1)
  {
    -[JEMediaActivityTracker setSeekActivity:](self, "setSeekActivity:", v22);
  }
  else if (!a3)
  {
    -[JEMediaActivityTracker setPlayActivity:](self, "setPlayActivity:", v22);
  }

  return v22;
}

- (void)stopActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7 transitioningEventData:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  if (a3 == 1)
  {
    -[JEMediaActivityTracker seekActivity](self, "seekActivity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[JEMediaActivityTracker setSeekActivity:](self, "setSeekActivity:", 0);
    -[JEMediaActivityTracker playlist](self, "playlist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "itemAtOverallPosition:rangeOptions:", a4, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPlaylistItem:", v20);

    if (!v18)
      goto LABEL_9;
  }
  else
  {
    if (a3)
    {
      v18 = 0;
      goto LABEL_9;
    }
    -[JEMediaActivityTracker playActivity](self, "playActivity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[JEMediaActivityTracker setPlayActivity:](self, "setPlayActivity:", 0);
    if (!v18)
      goto LABEL_9;
  }
  if (!objc_msgSend(v18, "isStopped"))
  {
    objc_msgSend(v18, "playlistItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[JEMediaActivityTracker combineEventData:withPlaylistDataForItem:](self, "combineEventData:withPlaylistDataForItem:", v16, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stoppedAtOverallPosition:type:reason:eventData:transitioningEventData:", a4, v14, v15, v22, v17);

    goto LABEL_12;
  }
LABEL_9:
  JEMetricsOSLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = 134217984;
    v25 = a3;
    _os_log_impl(&dword_19CCBB000, v23, OS_LOG_TYPE_ERROR, "JetEngine: There is no %ld activity to stop.", (uint8_t *)&v24, 0xCu);
  }

LABEL_12:
}

- (void)generatePlaylistTransitionsIfNecessary:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (-[JEMediaActivityTracker shouldGenerateTransitions](self, "shouldGenerateTransitions"))
  {
    -[JEMediaActivityTracker playActivity](self, "playActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "type") && (objc_msgSend(v6, "isStopped") & 1) == 0)
    {
      objc_msgSend(v6, "eventDataForTransitioningEvents");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[JEMediaActivityTracker playlist](self, "playlist");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "playlistItem");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemsBetweenStartOverallPosition:endOverallPosition:", objc_msgSend((id)v8, "startOverallPosition"), a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[JEMediaActivityTracker playlist](self, "playlist");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v8) = objc_opt_isKindOfClass();

      if ((v8 & 1) == 0)
      {
        +[JEMediaActivityTracker playlistItemComparator](JEMediaActivityTracker, "playlistItemComparator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sortedArrayUsingComparator:", v11);
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        v13 = 1;
        v26 = v9;
        do
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "startOverallPosition");
          objc_msgSend(v6, "playlistItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "startOverallPosition");

          if (v15 > v17)
          {
            if (v15 >= a3)
            {

              break;
            }
            -[JEMediaActivityTracker timeTracker](self, "timeTracker");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "estimatedTimeAtPosition:", v15);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v28, "timeIntervalSince1970");
            objc_msgSend(v19, "numberWithLongLong:", (uint64_t)(v20 * 1000.0));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = CFSTR("eventTime");
            v30 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = v22;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
            v23 = a3;
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            -[JEMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "stopActivity:overallPosition:type:reason:eventData:transitioningEventData:", 0, v15, CFSTR("automatic"), CFSTR("transition"), v24, v27);
            -[JEMediaActivityTracker startActivity:overallPosition:type:reason:eventData:transitioningEventData:](self, "startActivity:overallPosition:type:reason:eventData:transitioningEventData:", 0, v15, CFSTR("automatic"), CFSTR("transition"), v24, v27);
            v25 = objc_claimAutoreleasedReturnValue();

            a3 = v23;
            v9 = v26;

            v6 = (void *)v25;
          }

          ++v13;
        }
        while (objc_msgSend(v9, "count") > v13);
      }

    }
  }
}

+ (id)playlistItemComparator
{
  return &__block_literal_global_2;
}

uint64_t __48__JEMediaActivityTracker_playlistItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "startOverallPosition");
  v6 = objc_msgSend(v4, "startOverallPosition");

  v7 = -1;
  if (v5 >= v6)
    v7 = 1;
  if (v5 == v6)
    return 0;
  else
    return v7;
}

- (BOOL)shouldGenerateTransitions
{
  return self->_shouldGenerateTransitions;
}

- (void)setShouldGenerateTransitions:(BOOL)a3
{
  self->_shouldGenerateTransitions = a3;
}

- (NSObject)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_pipeline, a3);
}

- (JEMediaPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (JEMediaActivity)playActivity
{
  return self->_playActivity;
}

- (void)setPlayActivity:(id)a3
{
  objc_storeStrong((id *)&self->_playActivity, a3);
}

- (JEMediaActivity)seekActivity
{
  return self->_seekActivity;
}

- (void)setSeekActivity:(id)a3
{
  objc_storeStrong((id *)&self->_seekActivity, a3);
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (JEMediaTimeTracker)timeTracker
{
  return self->_timeTracker;
}

- (void)setTimeTracker:(id)a3
{
  objc_storeStrong((id *)&self->_timeTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeTracker, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_seekActivity, 0);
  objc_storeStrong((id *)&self->_playActivity, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
