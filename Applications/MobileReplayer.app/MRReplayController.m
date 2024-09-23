@implementation MRReplayController

- (MRReplayControllerDelegate)strongDelegate
{
  return (MRReplayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)sharedController
{
  if (qword_10000D428 != -1)
    dispatch_once(&qword_10000D428, &stru_1000082F0);
  return (id)qword_10000D420;
}

- (void)dealloc
{
  DYCounterSupport *shaderProfiler;
  objc_super v4;

  shaderProfiler = self->_shaderProfiler;
  self->_shaderProfiler = 0;

  v4.receiver = self;
  v4.super_class = (Class)MRReplayController;
  -[MRReplayController dealloc](&v4, "dealloc");
}

- (void)_displayPlaybackEngine
{
  UIViewController *backgroundImageViewController;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!pthread_main_np())
    __assert_rtn("-[MRReplayController _displayPlaybackEngine]", (const char *)&unk_1000055D9, 0, "pthread_main_np()");
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
  if (objc_msgSend(v7, "shouldCreateViewController"))
  {
    backgroundImageViewController = self->_backgroundImageViewController;

    if (backgroundImageViewController)
      return;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllerForPlaybackEngine:", v5));
    objc_msgSend(v4, "setViewController:", v6);

  }
}

- (id)_replayerControllerSupportForCaptureStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DYExtensionRegistry sharedExtensionRegistry](DYExtensionRegistry, "sharedExtensionRegistry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extensionsForSlot:", CFSTR("com.apple.mobileReplayer.replayControllerSupport")));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("class"), (_QWORD)v19));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundle"));
          v14 = (objc_class *)objc_msgSend(v13, "classNamed:", v12);

          if (v14)
          {
            v15 = objc_msgSend([v14 alloc], "initWithCaptureStore:", v4);
            v16 = v15;
            if (v15)
            {
              if ((objc_opt_respondsToSelector(v15, "setShouldCreateViewController:") & 1) != 0)
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
                objc_msgSend(v16, "setShouldCreateViewController:", objc_msgSend(v17, "shouldCreateViewController"));

              }
              goto LABEL_15;
            }
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  id v5;

  if ((id)objc_opt_class(MRReplayController, a2) == a1)
  {
    v2 = objc_alloc((Class)DYStandardPluginDirectoryProvider);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = objc_msgSend(v2, "initWithBundle:includeDeveloperDirectory:includeBundleDirectory:", v3, 0, 0);

    v4 = +[DYPluginLoader loadPluginsWithProvider:pathExtension:](DYPluginLoader, "loadPluginsWithProvider:pathExtension:", v5, CFSTR("mrplugin"));
  }
}

- (void)_processMessage:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  DYCounterSupport *v12;
  DYCounterSupport *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  DYCounterSupport *v21;
  DYCounterSupport *shaderProfiler;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSDictionary *v33;
  void *v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  _QWORD v48[4];
  id v49;
  MRReplayController *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  MRReplayController *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  MRReplayController *v60;
  id *v61;
  id v62;
  id location[5];
  id v64;
  id from;
  _QWORD v66[4];
  id v67;
  MRReplayController *v68;
  id v69;
  id v70;
  _QWORD v71[2];

  v4 = a3;
  v5 = objc_msgSend(v4, "kind");
  if (v5 - 4117 < 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
    v9 = objc_msgSend(v7, "isDebugPlaybackEngine:", v8);

    if ((v9 & 1) != 0)
    {
      if (objc_msgSend(v4, "kind") != 4117)
      {
        v46 = v7;
        if (!self->_shaderProfiler)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
          v21 = (DYCounterSupport *)objc_msgSend(v7, "newShaderProfilerWithPlaybackEngine:payload:", v19, v20);
          shaderProfiler = self->_shaderProfiler;
          self->_shaderProfiler = v21;

        }
        objc_initWeak(&from, self);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));
        v24 = v23 == 0;

        if (v24)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController shaderProfiler](self, "shaderProfiler"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
          objc_msgSend(v41, "updatePayload:", v42);

          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100003378;
          v48[3] = &unk_100008318;
          objc_copyWeak(&v52, &from);
          v49 = v7;
          v50 = self;
          v51 = v4;
          objc_msgSend(v43, "pushBlock:", v48);

          objc_destroyWeak(&v52);
        }
        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributes"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("collectInBackground")));
          v27 = v26 == 0;

          if (v27)
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100003140;
            v53[3] = &unk_100008318;
            objc_copyWeak(&v57, &from);
            v54 = v7;
            v55 = v4;
            v56 = self;
            objc_msgSend(v44, "pushBlock:", v53);

            objc_destroyWeak(&v57);
          }
          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController shaderProfiler](self, "shaderProfiler"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
            objc_msgSend(v28, "updatePayload:", v29);

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("maxDrawsInAnyEncoder")));

            if (v45)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController transport](self, "transport"));
              v32 = objc_msgSend(v4, "kind");
              v33 = objc_opt_new(NSDictionary);
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:plistPayload:](DYTransportMessage, "messageWithKind:plistPayload:", v32, v33));
              objc_msgSend(v31, "send:inReplyTo:error:", v34, v4, 0);

              v35 = (char *)objc_msgSend(v45, "unsignedIntegerValue");
              if (v35)
              {
                v36 = 0;
                do
                {
                  location[0] = 0;
                  location[1] = location;
                  location[2] = (id)0x3032000000;
                  location[3] = sub_100002F58;
                  location[4] = sub_100002F68;
                  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ++v36));
                  v71[0] = v37;
                  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v35));
                  v71[1] = v38;
                  v64 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));

                  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockBackgroundQueue](self, "profileBlockBackgroundQueue"));
                  v58[0] = _NSConcreteStackBlock;
                  v58[1] = 3221225472;
                  v58[2] = sub_100002F70;
                  v58[3] = &unk_100008368;
                  objc_copyWeak(&v62, &from);
                  v40 = v46;
                  v60 = self;
                  v61 = location;
                  v59 = v40;
                  objc_msgSend(v39, "pushBlock:", v58);

                  objc_destroyWeak(&v62);
                  _Block_object_dispose(location, 8);

                }
                while (v35 != v36);
              }
            }

          }
        }
        objc_destroyWeak(&from);
        goto LABEL_26;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
      v12 = (DYCounterSupport *)objc_msgSend(v7, "newShaderProfilerWithPlaybackEngine:payload:", v10, v11);
      v13 = self->_shaderProfiler;
      self->_shaderProfiler = v12;

      if (self->_shaderProfiler)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
        v46 = v7;
        objc_msgSend(v14, "clear");

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockBackgroundQueue](self, "profileBlockBackgroundQueue"));
        objc_msgSend(v15, "clear");

        objc_initWeak(location, self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileBlockQueue](self, "profileBlockQueue"));
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_100002E24;
        v66[3] = &unk_100008318;
        objc_copyWeak(&v70, location);
        v67 = v7;
        v68 = self;
        v69 = v4;
        objc_msgSend(v16, "pushBlock:", v66);

        objc_destroyWeak(&v70);
        objc_destroyWeak(location);
LABEL_26:
        v7 = v46;
        goto LABEL_27;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController transport](self, "transport"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[DYTransportMessage messageWithKind:](DYTransportMessage, "messageWithKind:", objc_msgSend(v4, "kind")));
    objc_msgSend(v17, "send:inReplyTo:error:", v18, v4, 0);

LABEL_27:
    goto LABEL_28;
  }
  if (v5 == 4101)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectPayload"));
    -[MRReplayController _updateBackgroundImage:](self, "_updateBackgroundImage:", v6);
  }
  else
  {
    if (v5 != 4113)
    {
      v47.receiver = self;
      v47.super_class = (Class)MRReplayController;
      -[MRReplayController _processMessage:](&v47, "_processMessage:", v4);
      goto LABEL_28;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "payload"));
    -[MRReplayController _updateBackgroundImage:](self, "_updateBackgroundImage:", v6);
  }

LABEL_28:
}

- (void)_updateBackgroundImage:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD block[5];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController strongDelegate](self, "strongDelegate"));
  v6 = objc_msgSend(v5, "shouldCreateViewController");

  if ((v6 & 1) != 0)
  {
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v4));
      v8 = v7;
      if (v7)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000036C8;
        v12[3] = &unk_1000083B8;
        v12[4] = self;
        v8 = v7;
        v13 = v8;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);

      }
      else
      {
        _DYOLog(self, kDYLoggingLevelError, CFSTR("failed to load background image data"));
      }
    }
    else
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "viewControllerForPlaybackEngine:", v9));

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000366C;
      block[3] = &unk_1000083B8;
      block[4] = self;
      v15 = v10;
      v11 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  objc_super v26;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController archiveStack](self, "archiveStack"));
  if (objc_msgSend(v10, "empty"))
    __assert_rtn("-[MRReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]", (const char *)&unk_1000055D9, 0, "![self.archiveStack empty]");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003B08;
    block[3] = &unk_1000083E0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController playbackEngine](self, "playbackEngine"));
    v15 = objc_opt_new(NSDictionary);
    v16 = objc_msgSend(v13, "newShaderProfilerWithPlaybackEngine:payload:", v14, v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", kDYQueryAvailableCounters));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "availableCountersForFrameProfiler:", v16));
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", kDYDerivedCounterData));

      if (!v22)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController profileInfo](self, "profileInfo"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "profilerCounters:withFrameProfiler:", v24, v16));

        goto LABEL_9;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MRReplayController replayControllerSupport](self, "replayControllerSupport"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "derivedCounterDataForFrameProfiler:", v16));
    }
    v23 = (void *)v20;
LABEL_9:

    objc_msgSend(v9, "resolveWithFuture:", v23);
    goto LABEL_10;
  }
  v26.receiver = self;
  v26.super_class = (Class)MRReplayController;
  -[MRReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:](&v26, "_playbackArchiveWithExperiment:passingFuture:resolvingFuture:", v8, v9, v5);
LABEL_10:

}

- (id)queue
{
  return self->queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->queue, a3);
}

- (id)playbackEngine
{
  return self->playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeStrong((id *)&self->playbackEngine, a3);
}

- (id)replayControllerSupport
{
  return self->replayControllerSupport;
}

- (void)setReplayControllerSupport:(id)a3
{
  objc_storeStrong((id *)&self->replayControllerSupport, a3);
}

- (id)experiments
{
  return self->experiments;
}

- (void)setExperiments:(id)a3
{
  objc_storeStrong((id *)&self->experiments, a3);
}

- (MRReplayControllerDelegate)delegate
{
  return (MRReplayControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DYCounterSupport)shaderProfiler
{
  return self->_shaderProfiler;
}

- (void)setShaderProfiler:(id)a3
{
  objc_storeStrong((id *)&self->_shaderProfiler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderProfiler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->experiments, 0);
  objc_storeStrong((id *)&self->replayControllerSupport, 0);
  objc_storeStrong((id *)&self->playbackEngine, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->_backgroundImageViewController, 0);
}

@end
