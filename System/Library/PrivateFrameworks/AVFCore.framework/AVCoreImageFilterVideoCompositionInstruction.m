@implementation AVCoreImageFilterVideoCompositionInstruction

- (BOOL)enablePostProcessing
{
  return 0;
}

- (BOOL)containsTweening
{
  return 1;
}

- (int)passthroughTrackID
{
  return 0;
}

- (AVCoreImageFilterVideoCompositionInstruction)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99750];
  v6 = NSStringFromSelector(sel_initWithTimeRange_sourceTrackIDs_handler_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Not available.  Use %@ instead"), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVCoreImageFilterVideoCompositionInstruction)initWithTimeRange:(id *)a3 sourceTrackIDs:(id)a4 handler:(id)a5
{
  char *v8;
  AVCoreImageFilterVideoCompositionInstruction *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVCoreImageFilterVideoCompositionInstruction;
  v8 = -[AVCoreImageFilterVideoCompositionInstruction init](&v15, sel_init);
  v9 = (AVCoreImageFilterVideoCompositionInstruction *)v8;
  if (v8)
  {
    v10 = MEMORY[0x1E0C9BAA8];
    v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)(v8 + 72) = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)(v8 + 88) = v11;
    *(_OWORD *)(v8 + 104) = *(_OWORD *)(v10 + 32);
    v13 = *(_OWORD *)&a3->var0.var0;
    v12 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)(v8 + 40) = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)(v8 + 8) = v13;
    *(_OWORD *)(v8 + 24) = v12;
    *((_QWORD *)v8 + 8) = objc_msgSend(a5, "copy");
    v9->_requiredSourceTrackIDs = (NSArray *)objc_msgSend(a4, "copy");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCoreImageFilterVideoCompositionInstruction;
  -[AVCoreImageFilterVideoCompositionInstruction dealloc](&v3, sel_dealloc);
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (NSArray)requiredSourceTrackIDs
{
  return self->_requiredSourceTrackIDs;
}

- (id)handler
{
  return self->_handler;
}

- (CGAffineTransform)sourceTrackPreferredTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setSourceTrackPreferredTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_sourceTrackPreferredTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_sourceTrackPreferredTransform.c = v4;
  *(_OWORD *)&self->_sourceTrackPreferredTransform.a = v3;
}

@end
