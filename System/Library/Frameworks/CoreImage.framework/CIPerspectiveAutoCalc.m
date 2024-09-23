@implementation CIPerspectiveAutoCalc

- (CIPerspectiveAutoCalc)initWithContext:(id)a3 image:(id)a4 config:(id *)a5
{
  char *v8;
  id v9;
  CIContext *v10;
  __int128 v11;
  __int128 v12;
  id var6;
  objc_super v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)CIPerspectiveAutoCalc;
  v8 = -[CIPerspectiveAutoCalc init](&v15, sel_init);
  v9 = a3;
  *((_QWORD *)v8 + 2) = v9;
  if (!v9)
  {
    v10 = [CIContext alloc];
    v16[0] = CFSTR("kCIContextName");
    v16[1] = CFSTR("kCIContextCacheIntermediates");
    v17[0] = CFSTR("CIPerspectiveAutoCalc");
    v17[1] = MEMORY[0x1E0C9AAA0];
    v16[2] = CFSTR("kCIContextIntermediateMemoryTarget");
    v17[2] = &unk_1E2F1BBD8;
    *((_QWORD *)v8 + 2) = -[CIContext initWithOptions:](v10, "initWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
  }
  *((_QWORD *)v8 + 1) = a4;
  v12 = *(_OWORD *)&a5->var2;
  v11 = *(_OWORD *)&a5->var4;
  var6 = a5->var6;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a5->var0;
  *((_QWORD *)v8 + 9) = var6;
  *(_OWORD *)(v8 + 56) = v11;
  *(_OWORD *)(v8 + 40) = v12;
  return (CIPerspectiveAutoCalc *)v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIPerspectiveAutoCalc;
  -[CIPerspectiveAutoCalc dealloc](&v3, sel_dealloc);
}

- (BOOL)compute
{
  return 0;
}

- (double)pitch
{
  return self->pitch;
}

- (double)yaw
{
  return self->yaw;
}

- (double)roll
{
  return self->roll;
}

- (double)confidence
{
  return self->confidence;
}

- (BOOL)generateDebugImage
{
  return self->generateDebugImage;
}

- (void)setGenerateDebugImage:(BOOL)a3
{
  self->generateDebugImage = a3;
}

- (CIImage)debugImage
{
  return self->debugImage;
}

- (int64_t)pitchFailureReason
{
  return self->pitchFailureReason;
}

- (int64_t)yawFailureReason
{
  return self->yawFailureReason;
}

@end
