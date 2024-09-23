@implementation CEKFluidBehaviorSettings

- (void)setDefaultValues
{
  -[CEKFluidBehaviorSettings setBehaviorType:](self, "setBehaviorType:", 2);
  -[CEKFluidBehaviorSettings setDeceleration:](self, "setDeceleration:", 0.998);
  -[CEKFluidBehaviorSettings setDampingRatio:](self, "setDampingRatio:", 0.845);
  -[CEKFluidBehaviorSettings setResponse:](self, "setResponse:", 0.531);
  -[CEKFluidBehaviorSettings setTrackingDampingRatio:](self, "setTrackingDampingRatio:", 0.86);
  -[CEKFluidBehaviorSettings setTrackingResponse:](self, "setTrackingResponse:", 0.15);
  -[CEKFluidBehaviorSettings setRetargetImpulse:](self, "setRetargetImpulse:", 0.0);
  -[CEKFluidBehaviorSettings setTrackingRetargetImpulse:](self, "setTrackingRetargetImpulse:", 0.0);
  -[CEKFluidBehaviorSettings setDampingRatioSmoothing:](self, "setDampingRatioSmoothing:", 0.0);
  -[CEKFluidBehaviorSettings setResponseSmoothing:](self, "setResponseSmoothing:", 0.0);
  -[CEKFluidBehaviorSettings setTrackingDampingRatioSmoothing:](self, "setTrackingDampingRatioSmoothing:", 0.0);
  -[CEKFluidBehaviorSettings setTrackingResponseSmoothing:](self, "setTrackingResponseSmoothing:", 0.0);
  -[CEKFluidBehaviorSettings setSmoothingAndProjectionEnabled:](self, "setSmoothingAndProjectionEnabled:", 0);
}

- (void)setDefaultCriticallyDampedValues
{
  -[CEKFluidBehaviorSettings setDefaultValues](self, "setDefaultValues");
  -[CEKFluidBehaviorSettings setDampingRatio:](self, "setDampingRatio:", 1.0);
  -[CEKFluidBehaviorSettings setResponse:](self, "setResponse:", 0.336);
}

- (double)_effectiveTrackingDampingRatio
{
  double result;

  if (-[CEKFluidBehaviorSettings behaviorType](self, "behaviorType") == 1)
    -[CEKFluidBehaviorSettings dampingRatio](self, "dampingRatio");
  else
    -[CEKFluidBehaviorSettings trackingDampingRatio](self, "trackingDampingRatio");
  return result;
}

- (double)_effectiveTrackingResponse
{
  double result;

  if (-[CEKFluidBehaviorSettings behaviorType](self, "behaviorType") == 1)
    -[CEKFluidBehaviorSettings response](self, "response");
  else
    -[CEKFluidBehaviorSettings trackingResponse](self, "trackingResponse");
  return result;
}

- (double)_effectiveTrackingRetargetImpulse
{
  double result;

  if (-[CEKFluidBehaviorSettings behaviorType](self, "behaviorType") == 1)
    -[CEKFluidBehaviorSettings retargetImpulse](self, "retargetImpulse");
  else
    -[CEKFluidBehaviorSettings trackingRetargetImpulse](self, "trackingRetargetImpulse");
  return result;
}

- (CAFrameRateRange)frameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_frameRateRange.minimum;
  maximum = self->_frameRateRange.maximum;
  preferred = self->_frameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  self->_frameRateRange = a3;
  self->_highFrameRateReason = a4;
}

- (double)settlingDuration
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0CD2848], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMass:", 1.0);
  -[CEKFluidBehaviorSettings dampingRatio](self, "dampingRatio");
  v5 = v4;
  -[CEKFluidBehaviorSettings response](self, "response");
  v7 = sqrt(6.28318531 / v6 * (6.28318531 / v6));
  v8 = v5 * (v7 + v7);
  objc_msgSend(v3, "setStiffness:");
  objc_msgSend(v3, "setDamping:", v8);
  objc_msgSend(v3, "settlingDuration");
  v10 = v9;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t behaviorType;
  uint64_t v6;
  id v7;
  NSString *name;
  id v9;
  double deceleration;
  id v11;
  double dampingRatio;
  id v13;
  double response;
  id v15;
  double retargetImpulse;
  id v17;
  double trackingDampingRatio;
  id v19;
  double trackingResponse;
  id v21;
  double trackingRetargetImpulse;
  id v23;
  _BOOL8 smoothingAndProjectionEnabled;
  id v25;
  void *v26;
  double dampingRatioSmoothing;
  id v28;
  void *v29;
  double responseSmoothing;
  id v31;
  void *v32;
  double trackingDampingRatioSmoothing;
  id v34;
  void *v35;
  double trackingResponseSmoothing;
  id v37;
  void *v38;
  double inertialTargetSmoothingRatio;
  id v40;
  void *v41;
  double inertialProjectionDeceleration;
  id v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  behaviorType = self->_behaviorType;
  v6 = MEMORY[0x1E0C809B0];
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke;
  v86[3] = &unk_1E70A4D60;
  v7 = v4;
  v87 = v7;
  objc_msgSend(v55, "appendInteger:counterpart:", behaviorType, v86);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  v84[0] = v6;
  v84[1] = 3221225472;
  v84[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_2;
  v84[3] = &unk_1E70A4D88;
  v9 = v7;
  v85 = v9;
  objc_msgSend(v54, "appendString:counterpart:", name, v84);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  deceleration = self->_deceleration;
  v82[0] = v6;
  v82[1] = 3221225472;
  v82[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_3;
  v82[3] = &unk_1E70A4DB0;
  v11 = v9;
  v83 = v11;
  objc_msgSend(v53, "appendDouble:counterpart:", v82, deceleration);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  dampingRatio = self->_dampingRatio;
  v80[0] = v6;
  v80[1] = 3221225472;
  v80[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_4;
  v80[3] = &unk_1E70A4DB0;
  v13 = v11;
  v81 = v13;
  objc_msgSend(v52, "appendCGFloat:counterpart:", v80, dampingRatio);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  v78[0] = v6;
  v78[1] = 3221225472;
  v78[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_5;
  v78[3] = &unk_1E70A4DB0;
  v15 = v13;
  v79 = v15;
  objc_msgSend(v51, "appendCGFloat:counterpart:", v78, response);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  retargetImpulse = self->_retargetImpulse;
  v76[0] = v6;
  v76[1] = 3221225472;
  v76[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_6;
  v76[3] = &unk_1E70A4DB0;
  v17 = v15;
  v77 = v17;
  objc_msgSend(v50, "appendCGFloat:counterpart:", v76, retargetImpulse);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  trackingDampingRatio = self->_trackingDampingRatio;
  v74[0] = v6;
  v74[1] = 3221225472;
  v74[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_7;
  v74[3] = &unk_1E70A4DB0;
  v19 = v17;
  v75 = v19;
  objc_msgSend(v49, "appendCGFloat:counterpart:", v74, trackingDampingRatio);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  trackingResponse = self->_trackingResponse;
  v72[0] = v6;
  v72[1] = 3221225472;
  v72[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_8;
  v72[3] = &unk_1E70A4DB0;
  v21 = v19;
  v73 = v21;
  objc_msgSend(v48, "appendCGFloat:counterpart:", v72, trackingResponse);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  trackingRetargetImpulse = self->_trackingRetargetImpulse;
  v70[0] = v6;
  v70[1] = 3221225472;
  v70[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_9;
  v70[3] = &unk_1E70A4DB0;
  v23 = v21;
  v71 = v23;
  objc_msgSend(v47, "appendCGFloat:counterpart:", v70, trackingRetargetImpulse);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  smoothingAndProjectionEnabled = self->_smoothingAndProjectionEnabled;
  v68[0] = v6;
  v68[1] = 3221225472;
  v68[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_10;
  v68[3] = &unk_1E70A4DD8;
  v25 = v23;
  v69 = v25;
  objc_msgSend(v46, "appendBool:counterpart:", smoothingAndProjectionEnabled, v68);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  dampingRatioSmoothing = self->_dampingRatioSmoothing;
  v66[0] = v6;
  v66[1] = 3221225472;
  v66[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_11;
  v66[3] = &unk_1E70A4DB0;
  v28 = v25;
  v67 = v28;
  objc_msgSend(v26, "appendCGFloat:counterpart:", v66, dampingRatioSmoothing);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  responseSmoothing = self->_responseSmoothing;
  v64[0] = v6;
  v64[1] = 3221225472;
  v64[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_12;
  v64[3] = &unk_1E70A4DB0;
  v31 = v28;
  v65 = v31;
  objc_msgSend(v29, "appendCGFloat:counterpart:", v64, responseSmoothing);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  trackingDampingRatioSmoothing = self->_trackingDampingRatioSmoothing;
  v62[0] = v6;
  v62[1] = 3221225472;
  v62[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_13;
  v62[3] = &unk_1E70A4DB0;
  v34 = v31;
  v63 = v34;
  objc_msgSend(v32, "appendCGFloat:counterpart:", v62, trackingDampingRatioSmoothing);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  trackingResponseSmoothing = self->_trackingResponseSmoothing;
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_14;
  v60[3] = &unk_1E70A4DB0;
  v37 = v34;
  v61 = v37;
  objc_msgSend(v35, "appendCGFloat:counterpart:", v60, trackingResponseSmoothing);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  inertialTargetSmoothingRatio = self->_inertialTargetSmoothingRatio;
  v58[0] = v6;
  v58[1] = 3221225472;
  v58[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_15;
  v58[3] = &unk_1E70A4DB0;
  v40 = v37;
  v59 = v40;
  objc_msgSend(v38, "appendCGFloat:counterpart:", v58, inertialTargetSmoothingRatio);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
  v56[0] = v6;
  v56[1] = 3221225472;
  v56[2] = __36__CEKFluidBehaviorSettings_isEqual___block_invoke_16;
  v56[3] = &unk_1E70A4DB0;
  v57 = v40;
  v43 = v40;
  objc_msgSend(v41, "appendCGFloat:counterpart:", v56, inertialProjectionDeceleration);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v40) = objc_msgSend(v44, "isEqual");

  return (char)v40;
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "behaviorType");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "name");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deceleration");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dampingRatio");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "response");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "retargetImpulse");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingDampingRatio");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingResponse");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingRetargetImpulse");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smoothingAndProjectionEnabled");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dampingRatioSmoothing");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "responseSmoothing");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingDampingRatioSmoothing");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "trackingResponseSmoothing");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inertialTargetSmoothingRatio");
}

uint64_t __36__CEKFluidBehaviorSettings_isEqual___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inertialProjectionDeceleration");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendInteger:", self->_behaviorType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendString:", self->_name);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendDouble:", self->_deceleration);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendCGFloat:", self->_dampingRatio);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "appendCGFloat:", self->_response);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendCGFloat:", self->_retargetImpulse);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendCGFloat:", self->_trackingDampingRatio);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendCGFloat:", self->_trackingResponse);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendCGFloat:", self->_trackingRetargetImpulse);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBool:", self->_smoothingAndProjectionEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendCGFloat:", self->_dampingRatioSmoothing);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendCGFloat:", self->_responseSmoothing);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendCGFloat:", self->_trackingDampingRatioSmoothing);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendCGFloat:", self->_trackingResponseSmoothing);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendCGFloat:", self->_inertialTargetSmoothingRatio);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendCGFloat:", self->_inertialProjectionDeceleration);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "hash");

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (!-[CEKFluidBehaviorSettings isEqual:](self, "isEqual:", v4))
  {
    objc_storeStrong((id *)(v4 + 144), self->_name);
    *(_QWORD *)(v4 + 32) = self->_behaviorType;
    *(double *)(v4 + 40) = self->_deceleration;
    *(double *)(v4 + 48) = self->_dampingRatio;
    *(double *)(v4 + 56) = self->_response;
    *(double *)(v4 + 72) = self->_trackingDampingRatio;
    *(double *)(v4 + 80) = self->_trackingResponse;
    *(double *)(v4 + 64) = self->_retargetImpulse;
    *(double *)(v4 + 88) = self->_trackingRetargetImpulse;
    *(double *)(v4 + 96) = self->_dampingRatioSmoothing;
    *(double *)(v4 + 104) = self->_responseSmoothing;
    *(double *)(v4 + 112) = self->_trackingDampingRatioSmoothing;
    *(double *)(v4 + 120) = self->_trackingResponseSmoothing;
    *(_BYTE *)(v4 + 24) = self->_smoothingAndProjectionEnabled;
    *(double *)(v4 + 128) = self->_inertialTargetSmoothingRatio;
    *(double *)(v4 + 136) = self->_inertialProjectionDeceleration;
  }
  return (id)v4;
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  double v8;
  double v9;
  double v10;
  $6E732EA7D3E0C9EC9CEEF7385E7E4683 *result;
  double inertialProjectionDeceleration;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (a5 == 1)
  {
    -[CEKFluidBehaviorSettings _effectiveTrackingDampingRatio](self, "_effectiveTrackingDampingRatio");
    retstr->var0 = v8;
    -[CEKFluidBehaviorSettings _effectiveTrackingResponse](self, "_effectiveTrackingResponse");
    retstr->var1 = v9;
    -[CEKFluidBehaviorSettings _effectiveTrackingRetargetImpulse](self, "_effectiveTrackingRetargetImpulse");
    retstr->var10 = v10;
    result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)-[CEKFluidBehaviorSettings smoothingAndProjectionEnabled](self, "smoothingAndProjectionEnabled");
    if ((_DWORD)result)
    {
      *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->_trackingDampingRatioSmoothing;
      if (!a4)
      {
        *(_WORD *)&retstr->var2 = 257;
        *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_dampingRatio;
      }
    }
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_dampingRatio;
    retstr->var10 = self->_retargetImpulse;
    result = ($6E732EA7D3E0C9EC9CEEF7385E7E4683 *)-[CEKFluidBehaviorSettings smoothingAndProjectionEnabled](self, "smoothingAndProjectionEnabled");
    if ((_DWORD)result)
    {
      *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->_dampingRatioSmoothing;
      if (a4 == 1)
      {
        inertialProjectionDeceleration = self->_inertialProjectionDeceleration;
        retstr->var8 = self->_inertialTargetSmoothingRatio * self->_trackingResponse;
        retstr->var9 = inertialProjectionDeceleration;
      }
    }
  }
  return result;
}

- (int64_t)behaviorType
{
  return self->_behaviorType;
}

- (void)setBehaviorType:(int64_t)a3
{
  self->_behaviorType = a3;
}

- (double)deceleration
{
  return self->_deceleration;
}

- (void)setDeceleration:(double)a3
{
  self->_deceleration = a3;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (double)trackingDampingRatio
{
  return self->_trackingDampingRatio;
}

- (void)setTrackingDampingRatio:(double)a3
{
  self->_trackingDampingRatio = a3;
}

- (double)trackingResponse
{
  return self->_trackingResponse;
}

- (void)setTrackingResponse:(double)a3
{
  self->_trackingResponse = a3;
}

- (double)trackingRetargetImpulse
{
  return self->_trackingRetargetImpulse;
}

- (void)setTrackingRetargetImpulse:(double)a3
{
  self->_trackingRetargetImpulse = a3;
}

- (BOOL)smoothingAndProjectionEnabled
{
  return self->_smoothingAndProjectionEnabled;
}

- (void)setSmoothingAndProjectionEnabled:(BOOL)a3
{
  self->_smoothingAndProjectionEnabled = a3;
}

- (double)dampingRatioSmoothing
{
  return self->_dampingRatioSmoothing;
}

- (void)setDampingRatioSmoothing:(double)a3
{
  self->_dampingRatioSmoothing = a3;
}

- (double)responseSmoothing
{
  return self->_responseSmoothing;
}

- (void)setResponseSmoothing:(double)a3
{
  self->_responseSmoothing = a3;
}

- (double)trackingDampingRatioSmoothing
{
  return self->_trackingDampingRatioSmoothing;
}

- (void)setTrackingDampingRatioSmoothing:(double)a3
{
  self->_trackingDampingRatioSmoothing = a3;
}

- (double)trackingResponseSmoothing
{
  return self->_trackingResponseSmoothing;
}

- (void)setTrackingResponseSmoothing:(double)a3
{
  self->_trackingResponseSmoothing = a3;
}

- (double)inertialTargetSmoothingRatio
{
  return self->_inertialTargetSmoothingRatio;
}

- (void)setInertialTargetSmoothingRatio:(double)a3
{
  self->_inertialTargetSmoothingRatio = a3;
}

- (double)inertialProjectionDeceleration
{
  return self->_inertialProjectionDeceleration;
}

- (void)setInertialProjectionDeceleration:(double)a3
{
  self->_inertialProjectionDeceleration = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
