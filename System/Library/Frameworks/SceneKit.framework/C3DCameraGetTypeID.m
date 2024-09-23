@implementation C3DCameraGetTypeID

double __C3DCameraGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DCameraGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("fStop"), 0x128u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("apertureBladeCount"), 0x130u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("aspectRatio"), 0x80u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("sensorHeight"), 0x12Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("lensShift"), 0x58u, 8, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("postProjectionTransformTranslation"), 0x60u, 8, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("postProjectionTransformScale"), 0x68u, 8, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("averageGray"), 0x184u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("bloomBlurRadius"), 0x1B8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("bloomIntensity"), 0x1A8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("bloomThreshold"), 0x1ACu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("bloomIteration"), 0x1B0u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("bloomIterationSpread"), 0x1B4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("colorFringeStrength"), 0x1C4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("colorFringeIntensity"), 0x1BCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("contrast"), 0x1CCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("grainIntensity"), 0x1D0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("grainScale"), 0x1D4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("exposureAdaptationBrighteningSpeedFactor"), 0x190u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("exposureAdaptationDarkeningSpeedFactor"), 0x194u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("exposureAdaptationDuration"), 0x18Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("exposureAdaptationHistogramRangeHighProbability"), 0x198u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("exposureAdaptationHistogramRangeLowProbability"), 0x19Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("exposureOffset"), 0x188u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("dofIntensity"), 0x1C0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("focusDistance"), 0x120u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("focalLength"), 0x124u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("fieldOfView"), 0x78u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("maximumExposure"), 0x1A4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("minimumExposure"), 0x1A0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("motionBlurIntensity"), 0x1D8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("orthographicScale"), 0x70u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("projectionTransform"), 0x90u, 11, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("saturation"), 0x1C8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("vignettingIntensity"), 0x1E0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("vignettingPower"), 0x1DCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("whitePoint"), 0x180u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("xFov"), 0x110u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("yFov"), 0x118u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("zFar"), 0x50u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("zNear"), 0x48u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionIntensity"), 0x1ECu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionRadius"), 0x1F0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionBias"), 0x1F4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionDepthThreshold"), 0x1F8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionNormalThreshold"), 0x1FCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionSampleCount"), 0x200u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceAmbientOcclusionDownSample"), 0x204u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("whiteBalanceTemperature"), 0x1E4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("whiteBalanceTint"), 0x1E8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  xmmword_1F03BFCE8 = kC3DC3DCameraContextClassAnimatable;
  result = *(double *)&kC3DC3DCameraContextClassSerializable;
  unk_1F03BFD40 = kC3DC3DCameraContextClassSerializable;
  unk_1F03BFD50 = *(_OWORD *)&off_1EA59CA28;
  qword_1F03BFCF8 = (uint64_t)_C3DCameraCopyInstanceVariables;
  qword_1F03BFD38 = (uint64_t)_C3DCameraSearchByID;
  return result;
}

@end
