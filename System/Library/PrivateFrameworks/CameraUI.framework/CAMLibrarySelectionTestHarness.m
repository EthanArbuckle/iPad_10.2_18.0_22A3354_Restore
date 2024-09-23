@implementation CAMLibrarySelectionTestHarness

- (CAMLibrarySelectionTestHarness)init
{
  abort();
}

- (CAMLibrarySelectionTestHarness)initWithTestName:(id)a3
{
  id v3;

  v3 = a3;
  abort();
}

- (CAMLibrarySelectionTestHarness)initWithTestName:(id)a3 librarySelectionController:(id)a4
{
  id v7;
  CAMLibrarySelectionTestHarness *v8;
  CAMLibrarySelectionTestHarness *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAMLibrarySelectionTestHarness;
  v8 = -[CAMPerformanceTestHarness initWithTestName:](&v11, sel_initWithTestName_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_librarySelectionController, a4);

  return v9;
}

- (void)startTesting
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  dispatch_time_t v7;
  const __CFString *v8;
  _QWORD block[5];

  -[CAMLibrarySelectionTestHarness librarySelectionController](self, "librarySelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v8 = CFSTR("Missing LibrarySelectionController");
LABEL_6:
    -[CAMPerformanceTestHarness failedTestWithReason:](self, "failedTestWithReason:", v8);
    goto LABEL_7;
  }
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "peopleProximityDetectionSupported");

  if ((v5 & 1) == 0)
  {
    v8 = CFSTR("Device Proximity not allowed");
    goto LABEL_6;
  }
  -[CAMLibrarySelectionTestHarness librarySelectionController](self, "librarySelectionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAndClearAcquiredSignals");

  v7 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CAMLibrarySelectionTestHarness_startTesting__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);
LABEL_7:

}

void __46__CAMLibrarySelectionTestHarness_startTesting__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[6];
  _QWORD v5[3];
  char v6;
  objc_super v7;

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)CAMLibrarySelectionTestHarness;
  objc_msgSendSuper2(&v7, sel_startTesting);
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  objc_msgSend(*(id *)(a1 + 32), "librarySelectionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__CAMLibrarySelectionTestHarness_startTesting__block_invoke_2;
  v4[3] = &unk_1EA329940;
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v5;
  objc_msgSend(v2, "ppt_installChangeHandler:", v4);

  objc_msgSend(*(id *)(a1 + 32), "librarySelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAcquiringSignals");

  _Block_object_dispose(v5, 8);
}

void __46__CAMLibrarySelectionTestHarness_startTesting__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[5];

  objc_msgSend(a2, "acquiredSignalResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesInProximity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v6 + 24))
    {
      *(_BYTE *)(v6 + 24) = 1;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__CAMLibrarySelectionTestHarness_startTesting__block_invoke_3;
      block[3] = &unk_1EA328868;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

uint64_t __46__CAMLibrarySelectionTestHarness_startTesting__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

- (CAMLibrarySelectionController)librarySelectionController
{
  return self->_librarySelectionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarySelectionController, 0);
}

@end
