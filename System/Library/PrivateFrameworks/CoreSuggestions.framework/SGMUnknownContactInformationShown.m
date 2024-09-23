@implementation SGMUnknownContactInformationShown

- (SGMUnknownContactInformationShown)init
{
  SGMUnknownContactInformationShown *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  PETScalarEventTracker *tracker;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)SGMUnknownContactInformationShown;
  v2 = -[SGMUnknownContactInformationShown init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("App"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("WasSuggestedContact"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0D80F38]);
    v11[0] = v3;
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithFeatureId:event:registerProperties:propertySubsets:", CFSTR("Found"), CFSTR("UnknownShown"), v6, MEMORY[0x1E0C9AA60]);
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v7;

  }
  return v2;
}

- (void)trackEventWithScalar:(unint64_t)a3 app:(SGMContactDetailUsedApp_)a4 wasSuggestedContact:(SGMTypeSafeBool_)a5
{
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PETScalarEventTracker *tracker;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (a4.var0 < 0xC)
  {
    v9 = off_1E47615F0[a4.var0];
    if (a5.var0)
      goto LABEL_3;
LABEL_6:
    v10 = CFSTR("0");
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMContactDetailUsedApp_toString(SGMContactDetailUsedApp)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SGMetricsDefines.h"), 94, CFSTR("unrecognized tag %lu on SGMContactDetailUsedApp"), a4.var0);

  v9 = CFSTR("ERR_UNMATCHED_TAG");
  if (!a5.var0)
    goto LABEL_6;
LABEL_3:
  if (a5.var0 == 1)
  {
    v10 = CFSTR("1");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SGMTypeSafeBool_toString(SGMTypeSafeBool)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SGMetricsDefines.h"), 12, CFSTR("unrecognized tag %lu on SGMTypeSafeBool"), a5.var0);

    v10 = CFSTR("ERR_UNMATCHED_TAG");
  }
LABEL_8:
  tracker = self->_tracker;
  v17[0] = v9;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v16, a3);

}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
}

@end
