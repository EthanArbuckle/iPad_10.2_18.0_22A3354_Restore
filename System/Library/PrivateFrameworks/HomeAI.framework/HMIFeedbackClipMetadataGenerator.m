@implementation HMIFeedbackClipMetadataGenerator

+ (id)metadataForCameraProfile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _QWORD v63[13];
  _QWORD v64[15];

  v64[13] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "settingsControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nightVision");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentHorizontalTilt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVerticalTilt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "opticalZoom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "digitalZoom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageRotation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v4;
  objc_msgSend(v4, "imageMirroring");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "name");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "model");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "manufacturer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firmwareVersion");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "room");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "name");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = 0;
    }

    v63[0] = CFSTR("cameraName");
    if (v57)
    {
      v48 = 0;
      v15 = (uint64_t)v57;
      goto LABEL_9;
    }
  }
  else
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    v61 = 0;
    v62 = 0;
    v63[0] = CFSTR("cameraName");
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v15 = objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v48 = 1;
LABEL_9:
  v43 = (void *)v15;
  v64[0] = v15;
  v63[1] = CFSTR("cameraUUID");
  objc_msgSend(v59, "UUIDString");
  v16 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v42 = (void *)v16;
  v64[1] = v16;
  v63[2] = CFSTR("roomName");
  v17 = (uint64_t)v60;
  if (!v60)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (void *)v17;
  v64[2] = v17;
  v63[3] = CFSTR("nightVision");
  objc_msgSend(v5, "value");
  v18 = objc_claimAutoreleasedReturnValue();
  v56 = (void *)v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v49 = v12;
  v40 = (void *)v18;
  v64[3] = v18;
  v63[4] = CFSTR("currentHorizontalTilt");
  objc_msgSend(v6, "value");
  v19 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v54 = v6;
  v39 = (void *)v19;
  v64[4] = v19;
  v63[5] = CFSTR("currentVerticalTilt");
  objc_msgSend(v7, "value");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v20;
  v64[5] = v20;
  v63[6] = CFSTR("opticalZoom");
  v52 = v8;
  objc_msgSend(v8, "value");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v53 = v7;
  v37 = (void *)v22;
  v64[6] = v22;
  v63[7] = CFSTR("digitalZoom");
  objc_msgSend(v9, "value");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v45 = v21;
  v36 = (void *)v24;
  v64[7] = v24;
  v63[8] = CFSTR("imageRotation");
  objc_msgSend(v10, "value");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v26;
  v64[8] = v26;
  v63[9] = CFSTR("imageMirroring");
  v50 = v11;
  objc_msgSend(v11, "value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v51 = v5;
  v64[9] = v29;
  v63[10] = CFSTR("model");
  v30 = v62;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64[10] = v30;
  v63[11] = CFSTR("manufacturer");
  v31 = v61;
  if (!v61)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64[11] = v31;
  v63[12] = CFSTR("firmwareVersion");
  v32 = v58;
  if (!v58)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v64[12] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 13);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  if (!v58)

  if (!v61)
  if (!v62)

  if (!v28)
  if (!v27)

  if (!v25)
  if (!v23)

  if (!v45)
  if (!v46)

  v33 = v56;
  if (!v56)
  {

    v33 = 0;
  }

  if (v60)
  {
    if (v47)
      goto LABEL_55;
  }
  else
  {

    if (v47)
      goto LABEL_55;
  }

LABEL_55:
  if (v48)

  return v44;
}

+ (id)metadataForClip:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "significantEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = CFSTR("clipUUID");
  objc_msgSend(v3, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = CFSTR("startDate");
  objc_msgSend(v3, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMIConvertNSDateToIsoDateString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v17[2] = CFSTR("duration");
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "duration");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v11, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  v17[3] = CFSTR("quality");
  objc_msgSend(v3, "quality");

  HMStringFromCameraClipQuality();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v13;
  v17[4] = CFSTR("significantEvents");
  objc_msgSend(v5, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __52__HMIFeedbackClipMetadataGenerator_metadataForClip___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("timeOffsetWithinClip");
  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = a2;
  objc_msgSend(v3, "timeOffsetWithinClip");
  objc_msgSend(v2, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v12[1] = CFSTR("dateOfOccurrence");
  objc_msgSend(v3, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HMIConvertNSDateToIsoDateString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("confidenceLevel");
  objc_msgSend(v3, "confidenceLevel");
  HMStringFromCameraSignificantEventConfidenceLevel();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  v12[3] = CFSTR("reason");
  objc_msgSend(v3, "reason");

  HMStringFromCameraSignificantEventReason();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)metadataForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7 = CFSTR("homeUUID");
  objc_msgSend(a3, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)metadataForClip:(id)a3 withCameraProfile:(id)a4 inHome:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  HMIFeedbackClipMetadata *v12;

  v7 = a5;
  v8 = a4;
  +[HMIFeedbackClipMetadataGenerator metadataForClip:](HMIFeedbackClipMetadataGenerator, "metadataForClip:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIFeedbackClipMetadataGenerator metadataForCameraProfile:](HMIFeedbackClipMetadataGenerator, "metadataForCameraProfile:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMIFeedbackClipMetadataGenerator metadataForHome:](HMIFeedbackClipMetadataGenerator, "metadataForHome:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HMIFeedbackClipMetadata initWithClipMetadata:cameraMetadata:homeMetadata:]([HMIFeedbackClipMetadata alloc], "initWithClipMetadata:cameraMetadata:homeMetadata:", v9, v10, v11);
  return v12;
}

@end
