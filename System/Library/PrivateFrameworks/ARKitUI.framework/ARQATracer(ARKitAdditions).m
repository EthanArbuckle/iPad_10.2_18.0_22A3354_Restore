@implementation ARQATracer(ARKitAdditions)

- (void)_startScreenRecording
{
  ARScreenRecording *v2;
  void *v3;
  _QWORD v4[5];

  if (objc_msgSend(a1, "recordScreen"))
  {
    v2 = objc_alloc_init(ARScreenRecording);
    objc_msgSend(a1, "setScreenRecorder:", v2);

    objc_msgSend(a1, "screenRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __51__ARQATracer_ARKitAdditions___startScreenRecording__block_invoke;
    v4[3] = &unk_1EA5867B0;
    v4[4] = a1;
    objc_msgSend(v3, "startRecordingWithHandler:", v4);

  }
}

- (void)_stopScreenRecording
{
  void *v2;
  _QWORD v3[5];

  if (objc_msgSend(a1, "recordScreen"))
  {
    objc_msgSend(a1, "screenRecorder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __50__ARQATracer_ARKitAdditions___stopScreenRecording__block_invoke;
    v3[3] = &unk_1EA5867B0;
    v3[4] = a1;
    objc_msgSend(v2, "stopRecordingWithHandler:", v3);

  }
}

@end
