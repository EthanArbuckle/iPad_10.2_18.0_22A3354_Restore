@implementation CornobbleTestRunner

+ (void)performFingerOnGlassScrollWithParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!RecapLibraryCore_frameworkLibrary)
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  if (RecapLibraryCore_frameworkLibrary)
  {
    objc_msgSend(v4, "testName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventStream");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "completionHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "performTestNamed:withEventStream:completionHandler:", v5, v6, v7);

  }
}

uint64_t __74__CornobbleTestRunner_performTestNamed_withEventStream_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishedTest:waitForCommit:extraResults:", *(_QWORD *)(a1 + 32), 1, 0);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 pages:(unint64_t)a6 direction:(int64_t)a7 canFlick:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;

  v9 = a8;
  v16 = a9;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v17, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  objc_msgSend(v19, "convertRect:toView:", 0);
  v21 = v20;
  v23 = v22;

  v24 = CRNAxisFromScrollDirection(a7);
  +[CRNStandardScrollTestParameters parametersForTestName:scrollView:iterations:amplitude:direction:preventDismissalGestures:canUseFlicks:completionHandler:](CRNStandardScrollTestParameters, "parametersForTestName:scrollView:iterations:amplitude:direction:preventDismissalGestures:canUseFlicks:completionHandler:", v18, v17, a5, a7, 0, v9, CRNSizeAlongAxis(v24, v21, v23) * (double)a6, v16);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "performFingerOnGlassScrollWithParameters:", v25);
}

+ (BOOL)isCornobbleAvailable
{
  if (!RecapLibraryCore_frameworkLibrary)
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  return RecapLibraryCore_frameworkLibrary != 0;
}

+ (void)playInteraction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "composerBlock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performTestNamed:usingComposer:completionHandler:", 0, v7, v6);

}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4
{
  objc_msgSend(a1, "performStandardScrollingTestNamed:onScrollView:iterations:", a3, a4, 3);
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5
{
  objc_msgSend(a1, "performStandardScrollingTestNamed:onScrollView:iterations:canFlick:", a3, a4, a5, 1);
}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 canFlick:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v7 = a6;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = CRNQuadrantOfContentOffsetFor(v13);
  +[CRNStandardScrollTestParameters parametersForTestName:scrollView:iterations:direction:preventDismissalGestures:canUseFlicks:completionHandler:](CRNStandardScrollTestParameters, "parametersForTestName:scrollView:iterations:direction:preventDismissalGestures:canUseFlicks:completionHandler:", v14, v13, a5, CRNOppositeDirectionFrom(v15), 0, v7, v12);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "performFingerOnGlassScrollWithParameters:", v16);
}

+ (void)performTestNamed:(id)a3 withEventStream:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!RecapLibraryCore_frameworkLibrary)
  {
    v24 = xmmword_24F13B9D0;
    v25 = 0;
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RecapLibraryCore_frameworkLibrary)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startedTest:", v7);

    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v11 = (void *)getRCPPlayerPlaybackOptionsClass_softClass;
    v23 = getRCPPlayerPlaybackOptionsClass_softClass;
    v12 = MEMORY[0x24BDAC760];
    if (!getRCPPlayerPlaybackOptionsClass_softClass)
    {
      *(_QWORD *)&v24 = MEMORY[0x24BDAC760];
      *((_QWORD *)&v24 + 1) = 3221225472;
      v25 = __getRCPPlayerPlaybackOptionsClass_block_invoke;
      v26 = &unk_24F13B9F0;
      v27 = &v20;
      __getRCPPlayerPlaybackOptionsClass_block_invoke((uint64_t)&v24);
      v11 = (void *)v21[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v20, 8);
    v14 = objc_alloc_init(v13);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v15 = (void *)getRCPInlinePlayerClass_softClass;
    v23 = getRCPInlinePlayerClass_softClass;
    if (!getRCPInlinePlayerClass_softClass)
    {
      *(_QWORD *)&v24 = v12;
      *((_QWORD *)&v24 + 1) = 3221225472;
      v25 = __getRCPInlinePlayerClass_block_invoke;
      v26 = &unk_24F13B9F0;
      v27 = &v20;
      __getRCPInlinePlayerClass_block_invoke((uint64_t)&v24);
      v15 = (void *)v21[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v20, 8);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __74__CornobbleTestRunner_performTestNamed_withEventStream_completionHandler___block_invoke;
    v17[3] = &unk_24F13B9B0;
    v18 = v7;
    v19 = v9;
    objc_msgSend(v16, "playEventStream:options:completion:", v8, v14, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "failedTest:withFailure:", v7, CFSTR("Recap unavaliable"));
  }

}

+ (void)performTestNamed:(id)a3 usingComposer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!RecapLibraryCore_frameworkLibrary)
  {
    v12 = xmmword_24F13B9D0;
    v13 = 0;
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RecapLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getRCPSyntheticEventStreamClass(), "eventStreamWithEventActions:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "performTestNamed:withEventStream:completionHandler:", v8, v11, v10, v12, v13, v14);

}

+ (void)performTestNamed:(id)a3 withRecapFile:(id)a4 onView:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!RecapLibraryCore_frameworkLibrary)
  {
    v15 = xmmword_24F13B9D0;
    v16 = 0;
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RecapLibraryCore_frameworkLibrary)
  {
    objc_msgSend(getRCPSyntheticEventStreamClass(), "eventStreamWithFileURL:error:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(a1, "performTestNamed:withEventStream:completionHandler:", v10, v14, v13, v15, v16, v17);

}

+ (void)performTestNamed:(id)a3 withRecapCommandString:(id)a4 onView:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id RCPSyntheticEventStreamClass;
  void *v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!RecapLibraryCore_frameworkLibrary)
  {
    v17 = xmmword_24F13B9D0;
    v18 = 0;
    RecapLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (RecapLibraryCore_frameworkLibrary)
  {
    RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(RCPSyntheticEventStreamClass, "eventStreamWithCLIArguments:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(a1, "performTestNamed:withEventStream:completionHandler:", v10, v16, v13, v17, v18, v19);

}

+ (void)performStandardScrollingTestNamed:(id)a3 onScrollView:(id)a4 iterations:(unint64_t)a5 canFlick:(BOOL)a6
{
  objc_msgSend(a1, "performStandardScrollingTestNamed:onScrollView:iterations:canFlick:completionHandler:", a3, a4, a5, a6, 0);
}

+ (void)performTestNamed:(id)a3 usingComposer:(id)a4
{
  objc_msgSend(a1, "performTestNamed:usingComposer:completionHandler:", a3, a4, 0);
}

+ (void)performTestNamed:(id)a3 withEventStream:(id)a4
{
  objc_msgSend(a1, "performTestNamed:withEventStream:completionHandler:", a3, a4, 0);
}

+ (void)performTestNamed:(id)a3 withRecapCommandString:(id)a4 onView:(id)a5
{
  objc_msgSend(a1, "performTestNamed:withRecapCommandString:onView:completionHandler:", a3, a4, a5, 0);
}

+ (void)performTestNamed:(id)a3 withRecapFile:(id)a4 onView:(id)a5
{
  objc_msgSend(a1, "performTestNamed:withRecapFile:onView:completionHandler:", a3, a4, a5, 0);
}

+ (void)performFingerOnGlassScrollTestNamed:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v6;

  +[CRNGroupScrollTestParameters parametersByCombining:testName:completionHandler:](CRNGroupScrollTestParameters, "parametersByCombining:testName:completionHandler:", a4, a3, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "performFingerOnGlassScrollWithParameters:", v6);

}

@end
