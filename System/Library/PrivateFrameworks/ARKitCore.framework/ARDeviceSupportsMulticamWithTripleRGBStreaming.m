@implementation ARDeviceSupportsMulticamWithTripleRGBStreaming

void __ARDeviceSupportsMulticamWithTripleRGBStreaming_block_invoke()
{
  ARVideoFormat *v0;
  uint64_t v1;
  double v2;
  double v3;
  ARVideoFormat *v4;
  ARVideoFormat *v5;
  ARVideoFormat *v6;
  ARVideoFormat *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = [ARVideoFormat alloc];
  v1 = *MEMORY[0x1E0C89FA0];
  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v4 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:](v0, "initWithImageResolution:captureDevicePosition:captureDeviceType:", 1, *MEMORY[0x1E0C89FA0], *MEMORY[0x1E0C9D820], v3);
  v9[0] = v4;
  v5 = [ARVideoFormat alloc];
  v6 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:](v5, "initWithImageResolution:captureDevicePosition:captureDeviceType:", 1, *MEMORY[0x1E0C89F98], v2, v3, v4);
  v9[1] = v6;
  v7 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:", 2, v1, v2, v3);
  v9[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ARDeviceSupportsMulticamWithTripleRGBStreaming_supportsMulticamWithTripleRGBStreaming = ARDeviceSupportsMulticamSessionWithVideoFormats(v8);
}

@end
