@implementation SFAnimationSettings

+ (SFAnimationSettings)quickTabSwitcherPan
{
  return (SFAnimationSettings *)sub_18B9887E8((uint64_t)a1, (uint64_t)a2, &qword_1EDFE8BB8, &qword_1EE007A58);
}

+ (SFAnimationSettings)quickTabSwitcherUpdate
{
  return (SFAnimationSettings *)sub_18B9887E8((uint64_t)a1, (uint64_t)a2, &qword_1EDFE8BC8, &qword_1EE007A68);
}

+ (SFAnimationSettings)tabOverviewScroll
{
  return (SFAnimationSettings *)sub_18B9887E8((uint64_t)a1, (uint64_t)a2, &qword_1EDFE8C68, &qword_1EE007B08);
}

+ (SFAnimationSettings)tabOverviewSwitcherScroll
{
  return (SFAnimationSettings *)sub_18B9887E8((uint64_t)a1, (uint64_t)a2, &qword_1EDFE8C50, &qword_1EE007AF0);
}

+ (SFAnimationSettings)tabOverviewUpdate
{
  return (SFAnimationSettings *)sub_18B9887E8((uint64_t)a1, (uint64_t)a2, &qword_1EDFE8C78, &qword_1EE007B18);
}

- (void)performInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  SFAnimationSettings *v11;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  if (v9)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    v9 = sub_18B998D64;
  }
  else
  {
    v10 = 0;
  }
  _Block_copy(v8);
  v11 = self;
  sub_18B997154(a3, (uint64_t)v9, v10, (uint64_t)v11, v8);
  sub_18B8D1DAC((uint64_t)v9);
  _Block_release(v8);
  _Block_release(v8);

}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  uint64_t v5;
  double *v6;
  double *v7;
  double *v8;
  double v9;
  double v10;

  v5 = *(_QWORD *)((char *)&self->var0 + OBJC_IVAR___SFAnimationSettings_wrapped);
  if (a5 == 1 && (*(_BYTE *)(v5 + 88) & 1) == 0)
  {
    v6 = (double *)(v5 + 64);
    v8 = (double *)(v5 + 80);
    v7 = (double *)(v5 + 72);
  }
  else
  {
    v6 = (double *)(v5 + 40);
    v7 = (double *)(v5 + 48);
    v8 = (double *)(v5 + 56);
  }
  v9 = *v7;
  v10 = *v8;
  retstr->var0 = *v6;
  retstr->var1 = v9;
  *(_WORD *)&retstr->var2 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  retstr->var10 = v10;
  return self;
}

- (SFAnimationSettings)init
{
  SFAnimationSettings *result;

  result = (SFAnimationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
