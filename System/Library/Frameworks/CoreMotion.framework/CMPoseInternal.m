@implementation CMPoseInternal

- (CMPoseInternal)initWithPose:(id *)a3
{
  CMPoseInternal *v4;
  CMAttitude *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CMPoseInternal;
  v4 = -[CMPoseInternal init](&v11, sel_init);
  if (v4)
  {
    v5 = [CMAttitude alloc];
    v4->fAttitude = (CMAttitude *)objc_msgSend_initWithQuaternion_(v5, v6, v7, v8, v9, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
    *(_OWORD *)&v4->fTranslation.x = *(_OWORD *)&a3->var1.var0;
    *(_OWORD *)&v4->fTranslation.z = *(_OWORD *)&a3->var1.var2;
    v4->fReceivedAuxTimestamp = a3->var3;
    v4->fMachAbsTimestamp = a3->var4;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMPoseInternal;
  -[CMPoseInternal dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double z;

  v5 = (void *)objc_opt_class();
  v9 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  v17 = objc_msgSend_init(v9, v10, v11, v12, v13);
  if (v17)
  {
    *(_QWORD *)(v17 + 8) = objc_msgSend_copyWithZone_(self->fAttitude, v14, (uint64_t)a3, v15, v16);
    z = self->fTranslation.z;
    *(_OWORD *)(v17 + 16) = *(_OWORD *)&self->fTranslation.x;
    *(double *)(v17 + 32) = z;
    *(double *)(v17 + 40) = self->fConsumedAuxTimestamp;
    *(double *)(v17 + 48) = self->fReceivedAuxTimestamp;
    *(double *)(v17 + 56) = self->fMachAbsTimestamp;
  }
  return (id)v17;
}

- (BOOL)isEqualToPoseInternal:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int isEqual;

  if (a3)
  {
    isEqual = objc_msgSend_isEqual_(self->fAttitude, a2, *((_QWORD *)a3 + 1), v3, v4);
    if (isEqual)
      LOBYTE(isEqual) = self->fTranslation.x == *((double *)a3 + 2)
                     && self->fTranslation.y == *((double *)a3 + 3)
                     && self->fTranslation.z == *((double *)a3 + 4)
                     && self->fConsumedAuxTimestamp == *((double *)a3 + 5)
                     && self->fReceivedAuxTimestamp == *((double *)a3 + 6)
                     && self->fMachAbsTimestamp == *((double *)a3 + 7);
  }
  else
  {
    LOBYTE(isEqual) = 0;
  }
  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (self == a3)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return MEMORY[0x1E0DE7D20](self, sel_isEqualToPoseInternal_, a3, v5, v6);
  else
    return 0;
}

@end
