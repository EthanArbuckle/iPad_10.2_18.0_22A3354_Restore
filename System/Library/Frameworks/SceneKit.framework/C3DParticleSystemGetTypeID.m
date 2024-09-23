@implementation C3DParticleSystemGetTypeID

double __C3DParticleSystemGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DParticleSystemGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("acceleration"), 0xA0u, 9, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("affectedByGravity"), 0x60u, 3, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("birthRate"), 0x40u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("birthRateVariation"), 0x44u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("dampingFactor"), 0x17Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("emissionDuration"), 0x6Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("emissionDurationVariation"), 0x70u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("emittingDirection"), 0x80u, 9, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("fixedTimeStep"), 0x184u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("fresnelExponent"), 0x18Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("idleDuration"), 0x74u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("idleDurationVariation"), 0x78u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("imageSequenceColumnCount"), 0x130u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("imageSequenceFrameRate"), 0x13Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("imageSequenceFrameRateVariation"), 0x140u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("imageSequenceInitialFrame"), 0x134u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("imageSequenceInitialFrameVariation"), 0x138u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("imageSequenceRowCount"), 0x132u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("isLocal"), 0x5Fu, 3, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("loops"), 0x65u, 3, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleAngle"), 0xB4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleAngleVariation"), 0xB8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleAngularVelocity"), 0xC4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleAngularVelocityVariation"), 0xC8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleBounce"), 0xD4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleBounceVariation"), 0xD8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleCharge"), 0xE4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleChargeVariation"), 0xE8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleColor"), 0x100u, 13, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleColorVariation"), 0x110u, 10, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleFriction"), 0xDCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleFrictionVariation"), 0xE0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleGeometries"), 0x160u, 5, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleLifeSpan"), 0xCCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleLifeSpanVariation"), 0xD0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleMass"), 0x174u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleMassVariation"), 0x178u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleSize"), 0x120u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleSizeVariation"), 0x124u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleIntensity"), 0x128u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleIntensityVariation"), 0x12Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleVelocity"), 0xBCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("particleVelocityVariation"), 0xC0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("speedFactor"), 0x180u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("spreadingAngle"), 0xB0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("stretchFactor"), 0xF8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("warmupDuration"), 0x48u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  result = *(double *)&kC3DC3DParticleSystemContextClassAnimatable;
  xmmword_1F03C11C0 = kC3DC3DParticleSystemContextClassAnimatable;
  return result;
}

@end
