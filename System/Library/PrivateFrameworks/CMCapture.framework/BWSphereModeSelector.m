@implementation BWSphereModeSelector

- (BOOL)lowPowerSphereModeEnabled
{
  return self->_lowPowerSphereModeEnabled;
}

- (void)setLowPowerSphereModeEnabled:(BOOL)a3
{
  self->_lowPowerSphereModeEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (__CFString)currentNonLowPowerSphereMode
{
  return self->_currentNonLowPowerSphereMode;
}

- (BWSphereModeSelector)initWithStillActivePreviewSupported:(BOOL)a3 sphereVideoSupported:(BOOL)a4 sphereVideoMaxFrameRate:(float)a5
{
  BWSphereModeSelector *result;
  __CFString *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWSphereModeSelector;
  result = -[BWSphereModeSelector init](&v10, sel_init);
  if (result)
  {
    v9 = (__CFString *)*MEMORY[0x1E0D07A58];
    result->_currentSphereMode = (__CFString *)*MEMORY[0x1E0D07A58];
    result->_currentNonLowPowerSphereMode = v9;
    result->_stillPreviewActiveSupported = a3;
    result->_sphereVideoSupported = a4;
    result->_maximumFrameRateSupported = fmaxf(a5, 120.0);
  }
  return result;
}

- (BOOL)sphereVideoSupported
{
  return self->_sphereVideoSupported;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (void)setAvoidsSphereRecentering:(BOOL)a3
{
  self->_avoidsSphereRecentering = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (BOOL)enablesSphereWhenAvailable
{
  return self->_enablesSphereWhenAvailable;
}

- (void)setOverCaptureEnabled:(BOOL)a3
{
  self->_overCaptureEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setEnablesSphereWhenAvailable:(BOOL)a3
{
  self->_enablesSphereWhenAvailable = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (uint64_t)_updateSphereMode
{
  uint64_t v1;
  void *v2;
  float v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;

  if (!result)
    return result;
  v1 = result;
  v2 = (void *)*MEMORY[0x1E0D07A58];
  if (*(_BYTE *)(result + 32))
  {
    v3 = *(float *)(result + 24);
    v4 = *MEMORY[0x1E0D07A58];
    if (v3 <= *(float *)(result + 48))
    {
      if (*(_BYTE *)(result + 28) && *(_BYTE *)(result + 29))
      {
        if (*(_BYTE *)(result + 47))
        {
          v5 = *(int *)(result + 40);
          v6 = sVideo60SphereModes;
        }
        else
        {
          if (!*(_BYTE *)(result + 46))
          {
            v10 = *(int *)(result + 40);
            v9 = &sVideo30SphereModes[3 * *(unsigned __int8 *)(result + 34) + v10];
            if (v3 < 60.0)
            {
              v6 = sVideo30SphereModes;
            }
            else
            {
              v9 = &sVideo60SphereModes[3 * *(unsigned __int8 *)(result + 34) + v10];
              v6 = sVideo60SphereModes;
            }
LABEL_19:
            v4 = *v6;
            v2 = (void *)*v9;
            if (v3 <= 60.0 && *(_BYTE *)(result + 30))
            {
              result = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D07A68]);
              if ((_DWORD)result)
              {
                v2 = (void *)*MEMORY[0x1E0D07A80];
              }
              else
              {
                result = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0D07A70]);
                if ((_DWORD)result)
                  v2 = (void *)*MEMORY[0x1E0D07A78];
              }
            }
            goto LABEL_36;
          }
          v5 = *(int *)(result + 40);
          v6 = &sOverCaptureVideoSphereModes;
        }
        v9 = &v6[3 * *(unsigned __int8 *)(result + 34) + v5];
        goto LABEL_19;
      }
      if (*(_BYTE *)(result + 35) && (*(_BYTE *)(result + 36) || *(_BYTE *)(result + 46)))
      {
        if (*(_BYTE *)(result + 44))
        {
          v7 = *(int *)(result + 40);
          v8 = &sZSLStillStationarySphereModes;
        }
        else
        {
          v7 = *(int *)(result + 40);
          if (*(_BYTE *)(result + 46))
            v8 = &sOverCaptureStillSphereModes;
          else
            v8 = &sZSLStillSphereModes;
        }
      }
      else if (*(_BYTE *)(result + 31))
      {
        v7 = *(int *)(result + 40);
        v8 = &sStillSphereModes;
      }
      else
      {
        v7 = *(int *)(result + 40);
        if (*(_BYTE *)(result + 45))
          v8 = &sDepthSphereModes;
        else
          v8 = &sDefaultSphereModes;
      }
      v2 = (void *)v8[3 * *(unsigned __int8 *)(result + 34) + v7];
      v4 = *v8;
    }
  }
  else
  {
    v4 = *MEMORY[0x1E0D07A58];
  }
LABEL_36:
  if (*(void **)(v1 + 8) != v2)
    *(_QWORD *)(v1 + 8) = v2;
  if (*(_QWORD *)(v1 + 16) != v4)
    *(_QWORD *)(v1 + 16) = v4;
  return result;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  self->_zeroShutterLagEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setVariableFrameRateVideoEnabled:(BOOL)a3
{
  self->_variableFrameRateVideoEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (__CFString)currentSphereMode
{
  return self->_currentSphereMode;
}

- (void)setSystemThermalLevel:(int)a3
{
  self->_sphereThermalLevel = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (void)setMaximumFrameRate:(float)a3
{
  self->_maximumFrameRate = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sDefaultSphereModes = *MEMORY[0x1E0D07A50];
    unk_1EE6BF150 = sDefaultSphereModes;
    qword_1EE6BF158 = sDefaultSphereModes;
    unk_1EE6BF160 = sDefaultSphereModes;
    qword_1EE6BF168 = sDefaultSphereModes;
    unk_1EE6BF170 = sDefaultSphereModes;
    sDepthSphereModes = *MEMORY[0x1E0D07A40];
    unk_1EE6BF180 = sDepthSphereModes;
    qword_1EE6BF188 = sDefaultSphereModes;
    unk_1EE6BF190 = sDefaultSphereModes;
    qword_1EE6BF198 = sDefaultSphereModes;
    unk_1EE6BF1A0 = sDefaultSphereModes;
    sVideo30SphereModes[0] = *MEMORY[0x1E0D07A70];
    *(_QWORD *)algn_1EE6BF258 = sVideo30SphereModes[0];
    qword_1EE6BF260 = sVideo30SphereModes[0];
    unk_1EE6BF268 = sDepthSphereModes;
    qword_1EE6BF270 = sDepthSphereModes;
    unk_1EE6BF278 = sDepthSphereModes;
    sVideo60SphereModes[0] = *MEMORY[0x1E0D07A68];
    *(_QWORD *)algn_1EE6BF288 = sVideo60SphereModes[0];
    qword_1EE6BF290 = sVideo60SphereModes[0];
    unk_1EE6BF298 = sDefaultSphereModes;
    qword_1EE6BF2A0 = sDefaultSphereModes;
    unk_1EE6BF2A8 = sDefaultSphereModes;
    sStillSphereModes = sDepthSphereModes;
    *(_QWORD *)algn_1EE6BF228 = sDepthSphereModes;
    qword_1EE6BF230 = sDefaultSphereModes;
    unk_1EE6BF238 = sDepthSphereModes;
    qword_1EE6BF240 = sDepthSphereModes;
    unk_1EE6BF248 = sDefaultSphereModes;
    sZSLStillSphereModes = *MEMORY[0x1E0D07A60];
    *(_QWORD *)algn_1EE6BF2B8 = sZSLStillSphereModes;
    qword_1EE6BF2C0 = sDepthSphereModes;
    unk_1EE6BF2C8 = sDepthSphereModes;
    qword_1EE6BF2D0 = sDepthSphereModes;
    unk_1EE6BF2D8 = sDepthSphereModes;
    sZSLStillStationarySphereModes = sDepthSphereModes;
    *(_QWORD *)algn_1EE6BF2E8 = sDepthSphereModes;
    qword_1EE6BF2F0 = sDefaultSphereModes;
    unk_1EE6BF2F8 = sDefaultSphereModes;
    qword_1EE6BF300 = sDefaultSphereModes;
    unk_1EE6BF308 = sDefaultSphereModes;
    sOverCaptureVideoSphereModes = sVideo30SphereModes[0];
    unk_1EE6BF1F0 = sVideo30SphereModes[0];
    qword_1EE6BF1F8 = sVideo30SphereModes[0];
    unk_1EE6BF200 = sDepthSphereModes;
    qword_1EE6BF208 = sDepthSphereModes;
    unk_1EE6BF210 = sDefaultSphereModes;
    sOverCaptureStillSphereModes = sZSLStillSphereModes;
    unk_1EE6BF1C0 = sZSLStillSphereModes;
    qword_1EE6BF1C8 = sDepthSphereModes;
    unk_1EE6BF1D0 = sDepthSphereModes;
    qword_1EE6BF1D8 = sDepthSphereModes;
    unk_1EE6BF1E0 = sDefaultSphereModes;
  }
}

- (BWSphereModeSelector)initWithStillActivePreviewSupported:(BOOL)a3 sphereVideoSupported:(BOOL)a4
{
  double v4;

  LODWORD(v4) = 0;
  return -[BWSphereModeSelector initWithStillActivePreviewSupported:sphereVideoSupported:sphereVideoMaxFrameRate:](self, "initWithStillActivePreviewSupported:sphereVideoSupported:sphereVideoMaxFrameRate:", a3, a4, v4);
}

- (float)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (BOOL)sphereVideoRecenteringEnabled
{
  return self->_sphereVideoRecenteringEnabled;
}

- (void)setSphereVideoRecenteringEnabled:(BOOL)a3
{
  self->_sphereVideoRecenteringEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (BOOL)avoidsSphereRecentering
{
  return self->_avoidsSphereRecentering;
}

- (BOOL)zeroShutterLagEnabled
{
  return self->_zeroShutterLagEnabled;
}

- (BOOL)overCaptureEnabled
{
  return self->_overCaptureEnabled;
}

- (BOOL)variableFrameRateVideoEnabled
{
  return self->_variableFrameRateVideoEnabled;
}

- (int)systemThermalLevel
{
  return self->_sphereThermalLevel;
}

- (void)setTripodModeEnabled:(BOOL)a3
{
  self->_tripodModeEnabled = a3;
  -[BWSphereModeSelector _updateSphereMode]((uint64_t)self);
}

- (BOOL)tripodModeEnabled
{
  return self->_tripodModeEnabled;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

@end
