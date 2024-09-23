@implementation AirPodsAudioSystemInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  DAChamberInputs *v8;
  void *v9;
  uint8_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  NSArray *v14;
  NSArray *frequencyBins;
  NSNumber *v16;
  NSNumber *stimulusFrontCroppingLength;
  NSNumber *v18;
  NSNumber *stimulusCroppingLength;
  NSNumber *v20;
  NSNumber *dataFrontCroppingLength;
  NSNumber *v22;
  NSNumber *dataCroppingLength;
  NSNumber *v24;
  NSNumber *crackleBaseFrequency;
  NSNumber *v26;
  NSNumber *crackleSamplingRate;
  NSNumber *v28;
  NSNumber *crackleNeighborDistance;
  NSNumber *v30;
  NSNumber *crackleNumberOfStages;
  uint64_t v32;
  NSSet *v33;
  void *v34;
  NSArray *v35;
  NSArray *crackleFilterCoeffs;
  void *v37;
  int64_t micRecordingsType;
  void *v39;
  NSMutableArray *v40;
  NSArray *v41;
  BOOL v42;
  unint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSArray *v50;
  void *v51;
  NSArray *v52;
  NSArray *micBufferNumbers;
  objc_super v55;
  _QWORD v56[4];
  _QWORD v57[2];
  NSMutableArray *v58;
  uint8_t buf[4];
  id v60;

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)AirPodsAudioSystemInputs;
  if (-[AudioSystemInputsCommon validateAndInitializeParameters:](&v55, "validateAndInitializeParameters:", v4))
  {
    v5 = DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Validating 8290 parameters: %@", buf, 0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs chamberInputs](self, "chamberInputs"));
    if (!v7)
    {
      v8 = objc_alloc_init(DAChamberInputs);
      -[AirPodsAudioSystemInputs setChamberInputs:](self, "setChamberInputs:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs chamberInputs](self, "chamberInputs"));
    v10 = objc_msgSend(v9, "validateAndInitializeParameters:", v4) ^ 1;
    buf[0] = v10;

    if ((v10 & 1) == 0)
    {
      v12 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSNumber, v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("energyBins"), v13, 1000, buf));
      frequencyBins = self->_frequencyBins;
      self->_frequencyBins = v14;

      -[NSArray count](self->_frequencyBins, "count");
      if (-[NSArray count](self->_frequencyBins, "count") <= 1)
        buf[0] = 1;
      v16 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("stimulusFrontCroppingLength"), &off_10001D6E8, &off_10001D700, &off_10001D6E8, buf));
      stimulusFrontCroppingLength = self->_stimulusFrontCroppingLength;
      self->_stimulusFrontCroppingLength = v16;

      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("stimulusCroppingLength"), &off_10001D6E8, &off_10001D700, &off_10001D718, buf));
      stimulusCroppingLength = self->_stimulusCroppingLength;
      self->_stimulusCroppingLength = v18;

      v20 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("dataFrontCroppingLength"), &off_10001D6E8, &off_10001D700, &off_10001D6E8, buf));
      dataFrontCroppingLength = self->_dataFrontCroppingLength;
      self->_dataFrontCroppingLength = v20;

      v22 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("dataCroppingLength"), &off_10001D6E8, &off_10001D700, &off_10001D718, buf));
      dataCroppingLength = self->_dataCroppingLength;
      self->_dataCroppingLength = v22;

      v24 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("crackleBaseFrequency"), &off_10001D730, &off_10001D700, &off_10001D748, buf));
      crackleBaseFrequency = self->_crackleBaseFrequency;
      self->_crackleBaseFrequency = v24;

      v26 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("crackleSamplingRate"), &off_10001D730, &off_10001D700, &off_10001D760, buf));
      crackleSamplingRate = self->_crackleSamplingRate;
      self->_crackleSamplingRate = v26;

      v28 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("crackleNeighborDistance"), &off_10001D730, &off_10001D700, &off_10001D778, buf));
      crackleNeighborDistance = self->_crackleNeighborDistance;
      self->_crackleNeighborDistance = v28;

      v30 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("crackleNumberOfStages"), &off_10001D730, &off_10001D700, &off_10001D790, buf));
      crackleNumberOfStages = self->_crackleNumberOfStages;
      self->_crackleNumberOfStages = v30;

      v33 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSNumber, v32));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v35 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_arrayFromRequiredKey:types:maxLength:failed:", CFSTR("crackleFilterCoeffs"), v34, 70, buf));
      crackleFilterCoeffs = self->_crackleFilterCoeffs;
      self->_crackleFilterCoeffs = v35;

      if (!-[NSArray count](self->_crackleFilterCoeffs, "count"))
        buf[0] = 1;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("micRecordingsType"), &off_10001D730, &off_10001D7A8, &off_10001D730, buf));
      self->_micRecordingsType = (int)objc_msgSend(v37, "intValue");

      micRecordingsType = self->_micRecordingsType;
      switch(micRecordingsType)
      {
        case 3:
          v56[0] = CFSTR("Bottom");
          v56[1] = CFSTR("Back");
          v56[2] = CFSTR("Top");
          v56[3] = CFSTR("BNC");
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 4));
          v40 = objc_opt_new(NSMutableArray);
          if (objc_msgSend(v39, "count"))
          {
            v43 = 0;
            do
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs inputNameToValue](self, "inputNameToValue"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v43));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v45));

              if (v46)
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs inputNameToValue](self, "inputNameToValue"));
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v43));
                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v48));
                -[NSMutableArray addObject:](v40, "addObject:", v49);

              }
              ++v43;
            }
            while ((unint64_t)objc_msgSend(v39, "count") > v43);
          }
          v41 = (NSArray *)-[NSMutableArray copy](v40, "copy");
          break;
        case 2:
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs inputNameToValue](self, "inputNameToValue"));
          v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Bottom")));
          v57[0] = v40;
          v50 = (NSArray *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs inputNameToValue](self, "inputNameToValue"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectForKeyedSubscript:](v50, "objectForKeyedSubscript:", CFSTR("BNC")));
          v57[1] = v51;
          v52 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
          micBufferNumbers = self->_micBufferNumbers;
          self->_micBufferNumbers = v52;

          goto LABEL_24;
        case 1:
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[AirPodsAudioSystemInputs inputNameToValue](self, "inputNameToValue"));
          v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("Bottom")));
          v58 = v40;
          v41 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
          break;
        default:
LABEL_25:
          self->_unpairAirPodsOnFinish = objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("unpairDeviceOnFinish"), 0, buf);
          self->_useBundledAudioStimulus = objc_msgSend(v4, "dk_BOOLFromKey:defaultValue:failed:", CFSTR("useBundledAudioStimulus"), 1, buf);
          v42 = buf[0] == 0;
          goto LABEL_26;
      }
      v50 = self->_micBufferNumbers;
      self->_micBufferNumbers = v41;
LABEL_24:

      goto LABEL_25;
    }
  }
  v42 = 0;
LABEL_26:

  return v42;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *inputNameToValue;
  objc_super v8;
  char v9;

  v8.receiver = self;
  v8.super_class = (Class)AirPodsAudioSystemInputs;
  v4 = a3;
  v9 = !-[AudioSystemInputsCommon validateAndInitializeSpecifications:](&v8, "validateAndInitializeSpecifications:", v4);
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_dictionaryFromRequiredKey:failed:", CFSTR("inputComponents"), &v9));

  inputNameToValue = self->_inputNameToValue;
  self->_inputNameToValue = v5;

  return v9 == 0;
}

- (id)makeOutputFromDictionary:(id)a3 validationFailed:(BOOL *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AirPodsAudioSystemInputs;
  v5 = a3;
  v6 = -[AudioSystemInputsCommon makeOutputFromDictionary:validationFailed:](&v11, "makeOutputFromDictionary:validationFailed:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dk_numberFromRequiredKey:lowerBound:upperBound:failed:", CFSTR("numberOfChannels"), &off_10001D850, &off_10001D860, a4, v11.receiver, v11.super_class));
  objc_msgSend(v7, "setNumberOfChannels:", (int)objc_msgSend(v8, "intValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("audioTestType"), &off_10001D6E8, &off_10001D730, &off_10001D6E8, a4));
  objc_msgSend(v7, "setAudioTestType:", (int)objc_msgSend(v9, "intValue"));

  return v7;
}

- (Class)outputsClass
{
  return (Class)objc_opt_class(AirPodsOutput, a2);
}

- (id)validOutputDeviceSet
{
  id v3;
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v3 = objc_alloc((Class)NSMutableSet);
  v8.receiver = self;
  v8.super_class = (Class)AirPodsAudioSystemInputs;
  v4 = -[AudioSystemInputsCommon validOutputDeviceSet](&v8, "validOutputDeviceSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithSet:", v5);

  objc_msgSend(v6, "addObject:", CFSTR("LeftBud"));
  objc_msgSend(v6, "addObject:", CFSTR("RightBud"));
  return v6;
}

- (DAChamberInputs)chamberInputs
{
  return self->_chamberInputs;
}

- (void)setChamberInputs:(id)a3
{
  objc_storeStrong((id *)&self->_chamberInputs, a3);
}

- (NSDictionary)inputNameToValue
{
  return self->_inputNameToValue;
}

- (BOOL)unpairAirPodsOnFinish
{
  return self->_unpairAirPodsOnFinish;
}

- (void)setUnpairAirPodsOnFinish:(BOOL)a3
{
  self->_unpairAirPodsOnFinish = a3;
}

- (BOOL)useBundledAudioStimulus
{
  return self->_useBundledAudioStimulus;
}

- (void)setUseBundledAudioStimulus:(BOOL)a3
{
  self->_useBundledAudioStimulus = a3;
}

- (int64_t)micRecordingsType
{
  return self->_micRecordingsType;
}

- (void)setMicRecordingsType:(int64_t)a3
{
  self->_micRecordingsType = a3;
}

- (NSArray)micBufferNumbers
{
  return self->_micBufferNumbers;
}

- (void)setMicBufferNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_micBufferNumbers, a3);
}

- (NSArray)frequencyBins
{
  return self->_frequencyBins;
}

- (NSNumber)stimulusFrontCroppingLength
{
  return self->_stimulusFrontCroppingLength;
}

- (NSNumber)stimulusCroppingLength
{
  return self->_stimulusCroppingLength;
}

- (NSNumber)dataFrontCroppingLength
{
  return self->_dataFrontCroppingLength;
}

- (NSNumber)dataCroppingLength
{
  return self->_dataCroppingLength;
}

- (NSNumber)crackleBaseFrequency
{
  return self->_crackleBaseFrequency;
}

- (NSNumber)crackleSamplingRate
{
  return self->_crackleSamplingRate;
}

- (NSNumber)crackleNeighborDistance
{
  return self->_crackleNeighborDistance;
}

- (NSNumber)crackleNumberOfStages
{
  return self->_crackleNumberOfStages;
}

- (NSArray)crackleFilterCoeffs
{
  return self->_crackleFilterCoeffs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crackleFilterCoeffs, 0);
  objc_storeStrong((id *)&self->_crackleNumberOfStages, 0);
  objc_storeStrong((id *)&self->_crackleNeighborDistance, 0);
  objc_storeStrong((id *)&self->_crackleSamplingRate, 0);
  objc_storeStrong((id *)&self->_crackleBaseFrequency, 0);
  objc_storeStrong((id *)&self->_dataCroppingLength, 0);
  objc_storeStrong((id *)&self->_dataFrontCroppingLength, 0);
  objc_storeStrong((id *)&self->_stimulusCroppingLength, 0);
  objc_storeStrong((id *)&self->_stimulusFrontCroppingLength, 0);
  objc_storeStrong((id *)&self->_frequencyBins, 0);
  objc_storeStrong((id *)&self->_micBufferNumbers, 0);
  objc_storeStrong((id *)&self->_inputNameToValue, 0);
  objc_storeStrong((id *)&self->_chamberInputs, 0);
}

@end
