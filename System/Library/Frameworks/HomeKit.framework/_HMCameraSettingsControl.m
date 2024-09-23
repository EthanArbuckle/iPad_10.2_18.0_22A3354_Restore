@implementation _HMCameraSettingsControl

- (_HMCameraSettingsControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 service:(id)a5
{
  id v8;
  _HMCameraSettingsControl *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  int *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  int v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v40.receiver = self;
  v40.super_class = (Class)_HMCameraSettingsControl;
  v9 = -[_HMCameraControl initWithCameraProfile:profileUniqueIdentifier:](&v40, sel_initWithCameraProfile_profileUniqueIdentifier_, a3, a4);
  if (v9)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v8, "characteristics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v15, "characteristicType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("0000011B-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__nightVision;
          if ((v17 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("0000007B-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__targetHorizontalTilt;
          if ((v20 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("0000006C-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__currentHorizontalTilt;
          if ((v22 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("0000007D-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__targetVerticalTilt;
          if ((v24 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("0000006E-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__currentVerticalTilt;
          if ((v26 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("0000011C-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__opticalZoom;
          if ((v28 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("0000011D-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__digitalZoom;
          if ((v30 & 1) != 0)
            goto LABEL_16;
          objc_msgSend(v15, "characteristicType");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("0000011E-0000-1000-8000-0026BB765291"));

          v18 = &OBJC_IVAR____HMCameraSettingsControl__imageRotation;
          if ((v32 & 1) == 0)
          {
            objc_msgSend(v15, "characteristicType");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("0000011F-0000-1000-8000-0026BB765291"));

            v18 = &OBJC_IVAR____HMCameraSettingsControl__imageMirroring;
            if (!v34)
              continue;
          }
LABEL_16:
          objc_storeStrong((id *)((char *)&v9->super.super.isa + *v18), v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v12);
    }

  }
  return v9;
}

- (HMCharacteristic)nightVision
{
  return self->_nightVision;
}

- (void)setNightVision:(id)a3
{
  objc_storeStrong((id *)&self->_nightVision, a3);
}

- (HMCharacteristic)currentHorizontalTilt
{
  return self->_currentHorizontalTilt;
}

- (void)setCurrentHorizontalTilt:(id)a3
{
  objc_storeStrong((id *)&self->_currentHorizontalTilt, a3);
}

- (HMCharacteristic)targetHorizontalTilt
{
  return self->_targetHorizontalTilt;
}

- (void)setTargetHorizontalTilt:(id)a3
{
  objc_storeStrong((id *)&self->_targetHorizontalTilt, a3);
}

- (HMCharacteristic)currentVerticalTilt
{
  return self->_currentVerticalTilt;
}

- (void)setCurrentVerticalTilt:(id)a3
{
  objc_storeStrong((id *)&self->_currentVerticalTilt, a3);
}

- (HMCharacteristic)targetVerticalTilt
{
  return self->_targetVerticalTilt;
}

- (void)setTargetVerticalTilt:(id)a3
{
  objc_storeStrong((id *)&self->_targetVerticalTilt, a3);
}

- (HMCharacteristic)opticalZoom
{
  return self->_opticalZoom;
}

- (void)setOpticalZoom:(id)a3
{
  objc_storeStrong((id *)&self->_opticalZoom, a3);
}

- (HMCharacteristic)digitalZoom
{
  return self->_digitalZoom;
}

- (void)setDigitalZoom:(id)a3
{
  objc_storeStrong((id *)&self->_digitalZoom, a3);
}

- (HMCharacteristic)imageRotation
{
  return self->_imageRotation;
}

- (void)setImageRotation:(id)a3
{
  objc_storeStrong((id *)&self->_imageRotation, a3);
}

- (HMCharacteristic)imageMirroring
{
  return self->_imageMirroring;
}

- (void)setImageMirroring:(id)a3
{
  objc_storeStrong((id *)&self->_imageMirroring, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageMirroring, 0);
  objc_storeStrong((id *)&self->_imageRotation, 0);
  objc_storeStrong((id *)&self->_digitalZoom, 0);
  objc_storeStrong((id *)&self->_opticalZoom, 0);
  objc_storeStrong((id *)&self->_targetVerticalTilt, 0);
  objc_storeStrong((id *)&self->_currentVerticalTilt, 0);
  objc_storeStrong((id *)&self->_targetHorizontalTilt, 0);
  objc_storeStrong((id *)&self->_currentHorizontalTilt, 0);
  objc_storeStrong((id *)&self->_nightVision, 0);
}

@end
