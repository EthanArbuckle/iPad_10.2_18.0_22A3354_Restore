@implementation DRPDropletFluidBehaviorSettings

- (int64_t)behaviorType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_behaviorType);
  swift_beginAccess();
  return *v2;
}

- (void)setBehaviorType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_behaviorType);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)name
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_name;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_23A84C21C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_name);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)deceleration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_deceleration);
  swift_beginAccess();
  return *v2;
}

- (void)setDeceleration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_deceleration);
  swift_beginAccess();
  *v4 = a3;
}

- (double)dampingRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setDampingRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)response
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_response);
  swift_beginAccess();
  return *v2;
}

- (void)setResponse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_response);
  swift_beginAccess();
  *v4 = a3;
}

- (double)retargetImpulse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_retargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setRetargetImpulse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_retargetImpulse);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingDampingRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingDampingRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingResponse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponse);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingResponse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponse);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingRetargetImpulse
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingRetargetImpulse);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingRetargetImpulse);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)smoothingAndProjectionEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_smoothingAndProjectionEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_smoothingAndProjectionEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (double)dampingRatioSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatioSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_dampingRatioSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)responseSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_responseSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setResponseSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_responseSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingDampingRatioSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatioSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingDampingRatioSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)trackingResponseSmoothing
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponseSmoothing);
  swift_beginAccess();
  return *v2;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_trackingResponseSmoothing);
  swift_beginAccess();
  *v4 = a3;
}

- (double)inertialTargetSmoothingRatio
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialTargetSmoothingRatio);
  swift_beginAccess();
  return *v2;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialTargetSmoothingRatio);
  swift_beginAccess();
  *v4 = a3;
}

- (double)inertialProjectionDeceleration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialProjectionDeceleration);
  swift_beginAccess();
  return *v2;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletFluidBehaviorSettings_inertialProjectionDeceleration);
  swift_beginAccess();
  *v4 = a3;
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  return (PTFrameRateRangeSettings *)*v2;
}

- (void)setPreferredFrameRateRange:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletFluidBehaviorSettings_preferredFrameRateRange);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setDefaultValues
{
  DRPDropletFluidBehaviorSettings *v2;

  v2 = self;
  DRPDropletFluidBehaviorSettings.setDefaultValues()();

}

- (void)setDefaultCriticallyDampedValues
{
  DRPDropletFluidBehaviorSettings *v2;

  v2 = self;
  -[DRPDropletFluidBehaviorSettings setDefaultValues](v2, sel_setDefaultValues);
  -[DRPDropletFluidBehaviorSettings setDampingRatio:](v2, sel_setDampingRatio_, 1.0);
  -[DRPDropletFluidBehaviorSettings setResponse:](v2, sel_setResponse_, 0.336);

}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  DRPDropletFluidBehaviorSettings *v8;
  double v9;
  $6E732EA7D3E0C9EC9CEEF7385E7E4683 *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  double v20;

  v8 = self;
  DRPDropletFluidBehaviorSettings.parametersForTransition(from:to:)(a4, a5, (uint64_t)&v14);
  LOBYTE(a5) = v15;
  LOBYTE(a4) = v16;
  v9 = v20;

  v11 = v17;
  v12 = v18;
  v13 = v19;
  *(_OWORD *)&retstr->var0 = v14;
  retstr->var2 = a5;
  retstr->var3 = a4;
  *(_OWORD *)&retstr->var4 = v11;
  *(_OWORD *)&retstr->var6 = v12;
  *(_OWORD *)&retstr->var8 = v13;
  retstr->var10 = v9;
  return result;
}

+ (id)settingsControllerModule
{
  id v2;

  _sSo31DRPDropletFluidBehaviorSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (NSString)description
{
  DRPDropletFluidBehaviorSettings *v2;
  void *v3;

  v2 = self;
  DRPDropletFluidBehaviorSettings.description.getter();

  v3 = (void *)sub_23A84C210();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (id)copy
{
  DRPDropletFluidBehaviorSettings *v2;
  void *v3;
  _QWORD v5[4];

  v2 = self;
  DRPDropletFluidBehaviorSettings.copy()(v5);

  __swift_project_boxed_opaque_existential_0(v5, v5[3]);
  v3 = (void *)sub_23A84C3F0();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  DRPDropletFluidBehaviorSettings *v4;
  DRPDropletFluidBehaviorSettings *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23A84C30C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = DRPDropletFluidBehaviorSettings.isEqual(_:)((uint64_t)v8);

  sub_23A821CC8((uint64_t)v8);
  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletFluidBehaviorSettings_preferredFrameRateRange));
}

@end
