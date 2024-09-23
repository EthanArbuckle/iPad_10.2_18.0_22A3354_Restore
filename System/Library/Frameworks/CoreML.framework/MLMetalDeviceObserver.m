@implementation MLMetalDeviceObserver

- (id)startObservingWithBlock:(id)a3 deviceObserver:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = MTLCreateSystemDefaultDevice();
  v6 = v5;
  if (v5)
  {
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  if (a4)
  {
    v8 = (void *)objc_opt_new();
    v9 = *a4;
    *a4 = v8;

  }
  return v7;
}

@end
