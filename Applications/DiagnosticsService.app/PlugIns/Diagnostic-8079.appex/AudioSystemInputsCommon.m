@implementation AudioSystemInputsCommon

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  NSArray *v8;
  NSArray *sources;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *sequences;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  Sequence *v32;
  void *v33;
  void *v34;
  void *v35;
  NSNumber *v36;
  NSNumber *motionDetectorThreshold;
  void *v38;
  void *v39;
  uint64_t v40;
  NSSet *v41;
  void *v42;
  NSArray *v43;
  NSArray *accessoryDetectorModelNumbers;
  void *v45;
  NSNumber *v46;
  NSNumber *orientationDetectorXThreshold;
  NSNumber *v48;
  NSNumber *orientationDetectorZThreshold;
  NSNumber *v50;
  NSNumber *fileDownloadTimeout;
  NSNumber *v52;
  NSNumber *sequenceTimeout;
  BOOL v54;
  void *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  char v66;
  const __CFString *v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];

  v4 = a3;
  v66 = 0;
  v6 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("sources"), v7, 80, &v66, &stru_100010380));
  sources = self->_sources;
  self->_sources = v8;

  if (!-[NSArray count](self->_sources, "count"))
    v66 = 1;
  dword_100016850 = -[NSArray count](self->_sources, "count") - 1;
  v11 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v56 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("sequence"), v12, 70, &v66));

  v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sequences = self->_sequences;
  self->_sequences = v14;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v13;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        v21 = objc_alloc_init((Class)NSMutableArray);
        v23 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("outputs"), v24, 70, &v66));

        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v59;
          do
          {
            for (j = 0; j != v28; j = (char *)j + 1)
            {
              if (*(_QWORD *)v59 != v29)
                objc_enumerationMutation(v26);
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemInputsCommon makeOutputFromDictionary:validationFailed:](self, "makeOutputFromDictionary:validationFailed:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j), &v66));
              objc_msgSend(v21, "addObject:", v31);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
          }
          while (v28);
        }

        v32 = objc_alloc_init(Sequence);
        -[Sequence setOutputs:](v32, "setOutputs:", v21);
        -[NSMutableArray addObject:](self->_sequences, "addObject:", v32);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v17);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dk_dictionaryFromRequiredKey:failed:", CFSTR("interruptDetectors"), &v66));
  v67 = CFSTR("active");
  v68 = &__kCFBooleanFalse;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dk_dictionaryFromKey:defaultValue:failed:", CFSTR("motion"), v34, &v66));
  self->_motionDetectorActive = objc_msgSend(v35, "dk_BOOLFromRequiredKey:failed:", CFSTR("active"), &v66);
  if (!v66 && -[AudioSystemInputsCommon isMotionDetectorActive](self, "isMotionDetectorActive"))
  {
    v36 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("threshold"), &off_100010E18, &off_100010E28, &v66));
    motionDetectorThreshold = self->_motionDetectorThreshold;
    self->_motionDetectorThreshold = v36;

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dk_dictionaryFromKey:defaultValue:failed:", CFSTR("headphones"), v34, &v66));
  self->_headphonesDetectorActive = objc_msgSend(v38, "dk_BOOLFromRequiredKey:failed:", CFSTR("active"), &v66);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dk_dictionaryFromKey:defaultValue:failed:", CFSTR("accessory"), v34, &v66));
  self->_accessoryDetectorActive = objc_msgSend(v39, "dk_BOOLFromRequiredKey:failed:", CFSTR("active"), &v66);
  if (!v66 && -[AudioSystemInputsCommon isAccessoryDetectorActive](self, "isAccessoryDetectorActive"))
  {
    v41 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSString, v40));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    v43 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "dk_arrayFromRequiredKey:types:maxLength:failed:validator:", CFSTR("modelNumbers"), v42, 50, &v66, &stru_1000103A0));
    accessoryDetectorModelNumbers = self->_accessoryDetectorModelNumbers;
    self->_accessoryDetectorModelNumbers = v43;

  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dk_dictionaryFromKey:defaultValue:failed:", CFSTR("orientation"), v34, &v66));
  self->_orientationDetectorActive = objc_msgSend(v45, "dk_BOOLFromRequiredKey:failed:", CFSTR("active"), &v66);
  if (!v66 && -[AudioSystemInputsCommon isOrientationDetectorActive](self, "isOrientationDetectorActive"))
  {
    v46 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("xThreshold"), &off_100010E38, &off_100010E48, &v66));
    orientationDetectorXThreshold = self->_orientationDetectorXThreshold;
    self->_orientationDetectorXThreshold = v46;

    v48 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("zThreshold"), &off_100010E38, &off_100010E48, &v66));
    orientationDetectorZThreshold = self->_orientationDetectorZThreshold;
    self->_orientationDetectorZThreshold = v48;

  }
  self->_saveRawRecording = objc_msgSend(v56, "dk_BOOLFromRequiredKey:failed:", CFSTR("saveRawRecording"), &v66);
  v50 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("fileDownloadTimeout"), &off_100010D58, &off_100010D70, &v66));
  fileDownloadTimeout = self->_fileDownloadTimeout;
  self->_fileDownloadTimeout = v50;

  v52 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("sequenceTimeout"), &off_100010D58, &off_100010D70, &v66));
  sequenceTimeout = self->_sequenceTimeout;
  self->_sequenceTimeout = v52;

  self->_useDBValuesFromSystem = objc_msgSend(v56, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("useDBValuesFromSystem"), 0, &v66);
  self->_useMeasurementMode = objc_msgSend(v56, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("useMeasurementMode"), 0, &v66);
  v54 = v66 == 0;

  return v54;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *inputValueToName;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *outputSpecifications;
  void *v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  AudioSystemInputsCommon *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  _BYTE v23[8];

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23[0] = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("inputComponents"), v23));
  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  inputValueToName = self->_inputValueToName;
  self->_inputValueToName = v6;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100003988;
  v16[3] = &unk_1000103C8;
  v8 = v5;
  v18 = self;
  v19 = &v20;
  v17 = v8;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (!*((_BYTE *)v21 + 24))
  {
    v9 = objc_msgSend(v8, "count");
    if (v9 != -[NSMutableDictionary count](self->_inputValueToName, "count"))
      *((_BYTE *)v21 + 24) = 1;
  }
  v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  outputSpecifications = self->_outputSpecifications;
  self->_outputSpecifications = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("outputComponents"), v21 + 3));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003A1C;
  v15[3] = &unk_100010418;
  v15[4] = self;
  v15[5] = &v20;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = *((_BYTE *)v21 + 24) == 0;

  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)makeOutputFromDictionary:(id)a3 validationFailed:(BOOL *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_alloc_init(-[AudioSystemInputsCommon outputsClass](self, "outputsClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemInputsCommon validOutputDeviceSet](self, "validOutputDeviceSet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_stringFromRequiredKey:inSet:failed:", CFSTR("output"), v8, a4));
  objc_msgSend(v7, "setOutputDevice:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", dword_100016850));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("source"), &off_100010D88, v10, a4));
  objc_msgSend(v7, "setSource:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("volume"), &off_100010E58, &off_100010E68, a4));
  objc_msgSend(v7, "setVolume:", v12);

  return v7;
}

- (Class)outputsClass
{
  return (Class)objc_opt_class(Output, a2);
}

- (id)validOutputDeviceSet
{
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("Receiver"), CFSTR("Top"), CFSTR("Bottom"), 0);
}

- (NSArray)sources
{
  return self->_sources;
}

- (NSMutableArray)sequences
{
  return self->_sequences;
}

- (BOOL)saveRawRecording
{
  return self->_saveRawRecording;
}

- (NSNumber)fileDownloadTimeout
{
  return self->_fileDownloadTimeout;
}

- (NSNumber)sequenceTimeout
{
  return self->_sequenceTimeout;
}

- (BOOL)isMotionDetectorActive
{
  return self->_motionDetectorActive;
}

- (NSNumber)motionDetectorThreshold
{
  return self->_motionDetectorThreshold;
}

- (BOOL)isHeadphonesDetectorActive
{
  return self->_headphonesDetectorActive;
}

- (BOOL)isAccessoryDetectorActive
{
  return self->_accessoryDetectorActive;
}

- (NSArray)accessoryDetectorModelNumbers
{
  return self->_accessoryDetectorModelNumbers;
}

- (BOOL)isOrientationDetectorActive
{
  return self->_orientationDetectorActive;
}

- (NSNumber)orientationDetectorXThreshold
{
  return self->_orientationDetectorXThreshold;
}

- (NSNumber)orientationDetectorZThreshold
{
  return self->_orientationDetectorZThreshold;
}

- (BOOL)isUsingMeasurementMode
{
  return self->_useMeasurementMode;
}

- (BOOL)isUsingDBValuesFromSystem
{
  return self->_useDBValuesFromSystem;
}

- (NSMutableDictionary)inputValueToName
{
  return self->_inputValueToName;
}

- (NSMutableDictionary)outputSpecifications
{
  return self->_outputSpecifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputSpecifications, 0);
  objc_storeStrong((id *)&self->_inputValueToName, 0);
  objc_storeStrong((id *)&self->_orientationDetectorZThreshold, 0);
  objc_storeStrong((id *)&self->_orientationDetectorXThreshold, 0);
  objc_storeStrong((id *)&self->_accessoryDetectorModelNumbers, 0);
  objc_storeStrong((id *)&self->_motionDetectorThreshold, 0);
  objc_storeStrong((id *)&self->_sequenceTimeout, 0);
  objc_storeStrong((id *)&self->_fileDownloadTimeout, 0);
  objc_storeStrong((id *)&self->_sequences, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

@end
