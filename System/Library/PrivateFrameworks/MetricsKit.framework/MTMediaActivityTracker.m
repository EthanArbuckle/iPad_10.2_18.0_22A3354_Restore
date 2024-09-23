@implementation MTMediaActivityTracker

- (MTMediaActivityTracker)initWithVPAFKit:(id)a3 playlist:(id)a4 eventData:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTMediaActivityTracker *v11;
  MTMediaActivityTracker *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MTMediaActivityTracker;
  v11 = -[MTMediaActivityTracker init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MTMediaActivityTracker setVpafKit:](v11, "setVpafKit:", v8);
    -[MTMediaActivityTracker setPlaylist:](v12, "setPlaylist:", v9);
    v13 = (void *)objc_msgSend(v10, "mutableCopy");
    -[MTMediaActivityTracker setEventData:](v12, "setEventData:", v13);

    -[MTMediaActivityTracker setShouldGenerateTransitions:](v12, "setShouldGenerateTransitions:", 1);
  }

  return v12;
}

- (void)playStartedWithPlaybackRate:(float)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v10;
  MTMediaTimeTracker *v11;
  double v12;
  MTMediaTimeTracker *v13;

  v10 = -[MTMediaActivityTracker startActivity:overallPosition:type:reason:eventData:](self, "startActivity:overallPosition:type:reason:eventData:", 0, a4, a5, a6, a7);
  if (-[MTMediaActivityTracker shouldGenerateTransitions](self, "shouldGenerateTransitions"))
  {
    v11 = [MTMediaTimeTracker alloc];
    *(float *)&v12 = a3;
    v13 = -[MTMediaTimeTracker initWithPosition:playbackRate:](v11, "initWithPosition:playbackRate:", a4, v12);
    -[MTMediaActivityTracker setTimeTracker:](self, "setTimeTracker:", v13);

  }
}

- (void)playStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  double v6;

  LODWORD(v6) = 1.0;
  -[MTMediaActivityTracker playStartedWithPlaybackRate:overallPosition:type:reason:eventData:](self, "playStartedWithPlaybackRate:overallPosition:type:reason:eventData:", a3, a4, a5, a6, v6);
}

- (void)playStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[MTMediaActivityTracker generatePlaylistTransitionsIfNecessary:](self, "generatePlaylistTransitionsIfNecessary:", a3);
  -[MTMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:](self, "stopActivity:overallPosition:type:reason:eventData:", 0, a3, v12, v11, v10);

  -[MTMediaActivityTracker setTimeTracker:](self, "setTimeTracker:", 0);
}

- (void)playTransitionedAtOverallPosition:(unint64_t)a3 eventData:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  -[MTMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:](self, "stopActivity:overallPosition:type:reason:eventData:", 0, a3, CFSTR("automatic"), CFSTR("transition"), v7);
  v6 = -[MTMediaActivityTracker startActivity:overallPosition:type:reason:eventData:](self, "startActivity:overallPosition:type:reason:eventData:", 0, a3, CFSTR("automatic"), CFSTR("transition"), v7);

}

- (void)seekStartedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  id v6;

  v6 = -[MTMediaActivityTracker startActivity:overallPosition:type:reason:eventData:](self, "startActivity:overallPosition:type:reason:eventData:", 1, a3, a4, a5, a6);
}

- (void)seekStoppedAtOverallPosition:(unint64_t)a3 type:(id)a4 reason:(id)a5 eventData:(id)a6
{
  -[MTMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:](self, "stopActivity:overallPosition:type:reason:eventData:", 1, a3, a4, a5, a6);
}

- (void)synchronizePlaybackRate:(float)a3 overallPosition:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  __CFString *v17;
  id v18;
  int v19;
  void *v20;
  double v21;
  char v22;
  uint64_t v23;
  void *v24;

  -[MTMediaActivityTracker playActivity](self, "playActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v24 = v7;
  if (v7 && (v15 = objc_msgSend(v7, "type"), v14 = v24, !v15))
  {
    v16 = a3 <= 0.0;
    v19 = objc_msgSend(v24, "isStopped");
    if ((v19 & 1) == 0 && a3 > 0.0)
    {
      -[MTMediaActivityTracker generatePlaylistTransitionsIfNecessary:](self, "generatePlaylistTransitionsIfNecessary:", a4);
      -[MTMediaActivityTracker timeTracker](self, "timeTracker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v21 = a3;
      objc_msgSend(v20, "updatePosition:playbackRate:", a4, v21);

      goto LABEL_7;
    }
    if (a3 > 0.0)
      v22 = 1;
    else
      v22 = v19;
    if ((v22 & 1) == 0)
    {
      v17 = CFSTR("Inconsistent state: did you forget to call playStopped?");
      goto LABEL_6;
    }
    v14 = v24;
    if (((v19 ^ 1) & 1) != 0)
      goto LABEL_8;
  }
  else
  {
    v16 = a3 <= 0.0;
  }
  if (!v16)
  {
    v17 = CFSTR("Inconsistent state: did you forget to call playStarted?");
LABEL_6:
    v18 = MTConfigurationError(110, v17, v8, v9, v10, v11, v12, v13, v23);
LABEL_7:
    v14 = v24;
  }
LABEL_8:

}

- (void)synchronizeAtOverallPosition:(unint64_t)a3
{
  id v5;

  -[MTMediaActivityTracker timeTracker](self, "timeTracker");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackRate");
  -[MTMediaActivityTracker synchronizePlaybackRate:overallPosition:](self, "synchronizePlaybackRate:overallPosition:", a3);

}

- (void)updateEventData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTMediaActivityTracker eventData](self, "eventData");
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
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMediaActivityTracker playlist](self, "playlist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MTMediaActivityTracker playlist](self, "playlist");
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
  -[MTMediaActivityTracker eventData](self, "eventData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v13);

  if (v6)
    objc_msgSend(v8, "addObjectsFromArray:", v6);
  v14 = (void *)objc_msgSend(v8, "copy");

  return v14;
}

- (id)startActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  MTMediaActivity *v17;
  void *v18;
  MTMediaActivity *v19;
  void *v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  -[MTMediaActivityTracker playlist](self, "playlist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemAtOverallPosition:rangeOptions:", a4, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [MTMediaActivity alloc];
  -[MTMediaActivityTracker vpafKit](self, "vpafKit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[MTMediaActivity initWithType:playlistItem:pafKit:](v17, "initWithType:playlistItem:pafKit:", a3, v16, v18);

  -[MTMediaActivityTracker combineEventData:withPlaylistDataForItem:](self, "combineEventData:withPlaylistDataForItem:", v12, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTMediaActivity startedAtOverallPosition:type:reason:eventData:](v19, "startedAtOverallPosition:type:reason:eventData:", a4, v14, v13, v20);
  if (a3 == 1)
  {
    -[MTMediaActivityTracker setSeekActivity:](self, "setSeekActivity:", v19);
  }
  else if (!a3)
  {
    -[MTMediaActivityTracker setPlayActivity:](self, "setPlayActivity:", v19);
  }

  return v19;
}

- (void)stopActivity:(int64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;

  v26 = a5;
  v12 = a6;
  v19 = a7;
  if (a3 == 1)
  {
    -[MTMediaActivityTracker seekActivity](self, "seekActivity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMediaActivityTracker setSeekActivity:](self, "setSeekActivity:", 0);
    -[MTMediaActivityTracker playlist](self, "playlist");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "itemAtOverallPosition:rangeOptions:", a4, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPlaylistItem:", v22);

    if (!v20)
    {
LABEL_9:
      v25 = MTConfigurationError(110, CFSTR("There is no %@ activity to stop."), v13, v14, v15, v16, v17, v18, a3);
      goto LABEL_10;
    }
  }
  else
  {
    if (a3)
    {
      v20 = 0;
      goto LABEL_9;
    }
    -[MTMediaActivityTracker playActivity](self, "playActivity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMediaActivityTracker setPlayActivity:](self, "setPlayActivity:", 0);
    if (!v20)
      goto LABEL_9;
  }
  if (objc_msgSend(v20, "isStopped"))
    goto LABEL_9;
  objc_msgSend(v20, "playlistItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMediaActivityTracker combineEventData:withPlaylistDataForItem:](self, "combineEventData:withPlaylistDataForItem:", v19, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stoppedAtOverallPosition:type:reason:eventData:", a4, v26, v12, v24);

LABEL_10:
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
  void *v12;
  unint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  if (-[MTMediaActivityTracker shouldGenerateTransitions](self, "shouldGenerateTransitions"))
  {
    -[MTMediaActivityTracker playActivity](self, "playActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && !objc_msgSend(v5, "type") && (objc_msgSend(v6, "isStopped") & 1) == 0)
    {
      objc_msgSend(v6, "eventDataForTransitioningEvents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTMediaActivityTracker playlist](self, "playlist");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "playlistItem");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemsBetweenStartOverallPosition:endOverallPosition:", +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", v8), a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[MTMediaActivityTracker playlist](self, "playlist");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      LOBYTE(v8) = objc_opt_isKindOfClass();

      if ((v8 & 1) != 0)
      {
        v11 = v9;
      }
      else
      {
        +[MTMediaActivityTracker playlistItemComparator](MTMediaActivityTracker, "playlistItemComparator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sortedArrayUsingComparator:", v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if ((unint64_t)objc_msgSend(v11, "count") >= 2)
      {
        for (i = 1; objc_msgSend(v11, "count") > i; ++i)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", v14);
          objc_msgSend(v6, "playlistItem");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", v16);

          if (v15 > v17)
          {
            if (v15 >= a3)
            {

              break;
            }
            -[MTMediaActivityTracker timeTracker](self, "timeTracker");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "estimatedTimeAtPosition:", v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = CFSTR("eventTime");
            objc_msgSend(v26, "mt_millisecondsSince1970");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v19;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
            v20 = v11;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = v21;
            v29[1] = v25;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
            v22 = a3;
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v11 = v20;
            -[MTMediaActivityTracker stopActivity:overallPosition:type:reason:eventData:](self, "stopActivity:overallPosition:type:reason:eventData:", 0, v15, CFSTR("automatic"), CFSTR("transition"), v23);
            -[MTMediaActivityTracker startActivity:overallPosition:type:reason:eventData:](self, "startActivity:overallPosition:type:reason:eventData:", 0, v15, CFSTR("automatic"), CFSTR("transition"), v23);
            v24 = objc_claimAutoreleasedReturnValue();

            a3 = v22;
            v6 = (void *)v24;
          }

        }
      }

    }
  }
}

+ (id)playlistItemComparator
{
  return &__block_literal_global_18;
}

uint64_t __48__MTMediaActivityTracker_playlistItemComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", a2);
  v6 = +[MTMediaActivity startOverallPositionForItem:](MTMediaActivity, "startOverallPositionForItem:", v4);

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

- (MTVPAFKit)vpafKit
{
  return (MTVPAFKit *)objc_loadWeakRetained((id *)&self->_vpafKit);
}

- (void)setVpafKit:(id)a3
{
  objc_storeWeak((id *)&self->_vpafKit, a3);
}

- (MTMediaPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_playlist, a3);
}

- (MTMediaActivity)playActivity
{
  return self->_playActivity;
}

- (void)setPlayActivity:(id)a3
{
  objc_storeStrong((id *)&self->_playActivity, a3);
}

- (MTMediaActivity)seekActivity
{
  return self->_seekActivity;
}

- (void)setSeekActivity:(id)a3
{
  objc_storeStrong((id *)&self->_seekActivity, a3);
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (MTMediaTimeTracker)timeTracker
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
  objc_storeStrong((id *)&self->_seekActivity, 0);
  objc_storeStrong((id *)&self->_playActivity, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_destroyWeak((id *)&self->_vpafKit);
}

@end
