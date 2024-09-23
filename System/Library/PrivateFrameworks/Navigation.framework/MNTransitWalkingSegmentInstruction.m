@implementation MNTransitWalkingSegmentInstruction

+ (id)instructionForWalkingSegment:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWalkingSegment:context:", v6, a4);

  return v7;
}

- (MNTransitWalkingSegmentInstruction)initWithWalkingSegment:(id)a3 context:(int64_t)a4
{
  id v7;
  MNTransitWalkingSegmentInstruction *v8;
  MNTransitWalkingSegmentInstruction *v9;
  MNTransitWalkingSegmentInstruction *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNTransitWalkingSegmentInstruction;
  v8 = -[MNTransitInstruction initWithContext:](&v12, sel_initWithContext_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_walkingSegment, a3);
    -[MNTransitInstruction _fillInInstructions](v9, "_fillInInstructions");
    v10 = v9;
  }

  return v9;
}

- (id)instructionSet
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MNTransitWalkingSegmentInstruction walkingSegment](self, "walkingSegment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "steps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315906;
      v9 = "-[MNTransitWalkingSegmentInstruction instructionSet]";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
      v12 = 1024;
      v13 = 378;
      v14 = 2080;
      v15 = "[step isKindOfClass:[GEOComposedTransitWalkingRouteStep class]]";
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v8, 0x26u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "instructions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)overridenInstructionsMapping
{
  return 0;
}

- (GEOComposedWalkingRouteSegment)walkingSegment
{
  return self->_walkingSegment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingSegment, 0);
}

@end
