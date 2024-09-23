@implementation DRPDropletPrototypeSettings

- (BOOL)suppressCompositingFilterMultiply
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply;
  swift_beginAccess();
  return *v2;
}

- (void)setSuppressCompositingFilterMultiply:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterMultiply;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)suppressCompositingFilterDestOut
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut;
  swift_beginAccess();
  return *v2;
}

- (void)setSuppressCompositingFilterDestOut:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressCompositingFilterDestOut;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)suppressDropletEffectFilters
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters;
  swift_beginAccess();
  return *v2;
}

- (void)setSuppressDropletEffectFilters:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_suppressDropletEffectFilters;
  swift_beginAccess();
  *v4 = a3;
}

- (double)rightEdgeHintSize
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize);
  swift_beginAccess();
  return *v2;
}

- (void)setRightEdgeHintSize:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintSize);
  swift_beginAccess();
  *v4 = a3;
}

- (double)rightEdgeHintDropletRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setRightEdgeHintDropletRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_rightEdgeHintDropletRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (double)edgeHintKeylineInnerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeHintKeylineInnerWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineInnerWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)edgeHintKeylineOuterWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeHintKeylineOuterWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineOuterWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (DRPDropletCAColorMatrixPrototypeSettings)edgeHintKeylineAdaptiveColorMatrix
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  return (DRPDropletCAColorMatrixPrototypeSettings *)*v2;
}

- (void)setEdgeHintKeylineAdaptiveColorMatrix:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix);
}

- (SUIAFluidBehaviorSettings)edgeHintCenterXAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintCenterXAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeHintCenterYAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintCenterYAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeHintContainerWidthAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintContainerWidthAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeHintContainerHeightAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintContainerHeightAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeHintKeylineStyleAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeHintKeylineStyleAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings);
}

- (double)edgeContentPresentedKeylineInnerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeContentPresentedKeylineInnerWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineInnerWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)edgeContentPresentedKeylineOuterWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setEdgeContentPresentedKeylineOuterWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineOuterWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (DRPDropletCAColorMatrixPrototypeSettings)edgeContentPresentedKeylineAdaptiveColorMatrix
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix);
  swift_beginAccess();
  return (DRPDropletCAColorMatrixPrototypeSettings *)*v2;
}

- (void)setEdgeContentPresentedKeylineAdaptiveColorMatrix:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix);
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedCenterXAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedCenterXAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedCenterYAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedCenterYAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedContainerWidthAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedContainerWidthAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedContainerHeightAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedContainerHeightAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings);
}

- (SUIAFluidBehaviorSettings)edgeContentPresentedKeylineStyleAnimationSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setEdgeContentPresentedKeylineStyleAnimationSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings);
}

- (double)intelligentEdgeLightKeylineStyleSoftLargeBlurRadius
{
  double *v2;

  v2 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftLargeBlurRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeBlurRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftLargeWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftLargeWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftLargeWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft;
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftSmallKeylineSoft:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallKeylineSoft;
  swift_beginAccess();
  *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleSoftSmallWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleSoftSmallWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleSoftSmallWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardLargeBlurRadius
{
  double *v2;

  v2 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardLargeBlurRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self
                + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeBlurRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardLargeWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardLargeWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardLargeWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)intelligentEdgeLightKeylineStyleHardSmallKeylineSoft
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft;
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardSmallKeylineSoft:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallKeylineSoft;
  swift_beginAccess();
  *v4 = a3;
}

- (double)intelligentEdgeLightKeylineStyleHardSmallWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightKeylineStyleHardSmallWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleHardSmallWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)intelligentEdgeLightEDRGainAmount
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount);
  swift_beginAccess();
  return *v2;
}

- (void)setIntelligentEdgeLightEDRGainAmount:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightEDRGainAmount);
  swift_beginAccess();
  *v4 = a3;
}

- (DRPDropletCAColorMatrixPrototypeSettings)intelligentEdgeLightKeylineStyleColorMatrix
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix);
  swift_beginAccess();
  return (DRPDropletCAColorMatrixPrototypeSettings *)*v2;
}

- (void)setIntelligentEdgeLightKeylineStyleColorMatrix:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix);
}

- (SUIAFluidBehaviorSettings)intelligentEdgeLightKeylineStyleDefaultBehaviorSettings
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.isa
            + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
  swift_beginAccess();
  return (SUIAFluidBehaviorSettings *)*v2;
}

- (void)setIntelligentEdgeLightKeylineStyleDefaultBehaviorSettings:(id)a3
{
  sub_23A8170D0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings);
}

- (void)setDefaultValues
{
  DRPDropletPrototypeSettings *v2;

  v2 = self;
  DRPDropletPrototypeSettings.setDefaultValues()();

}

+ (id)settingsControllerModule
{
  id v2;

  _sSo27DRPDropletPrototypeSettingsC9DropletUIE24settingsControllerModuleSo8PTModuleCSgyFZ_0();
  return v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineAdaptiveColorMatrix));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterXAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintCenterYAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerWidthAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintContainerHeightAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeHintKeylineStyleAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineAdaptiveColorMatrix));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterXAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedCenterYAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerWidthAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedContainerHeightAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_edgeContentPresentedKeylineStyleAnimationSettings));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleColorMatrix));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___DRPDropletPrototypeSettings_intelligentEdgeLightKeylineStyleDefaultBehaviorSettings));
}

@end
