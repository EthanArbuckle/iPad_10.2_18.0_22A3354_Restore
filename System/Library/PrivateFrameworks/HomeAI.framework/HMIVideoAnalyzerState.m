@implementation HMIVideoAnalyzerState

- (HMIVideoAnalyzerState)initWithConfiguration:(id)a3 dynamicConfiguration:(id)a4 identifier:(id)a5 monitored:(BOOL)a6 analysisFPS:(double)a7 timeSinceAnalyzerStarted:(double)a8 timeSinceLastFragmentWasReceived:(double)a9 bufferFillRatio:(double)a10 bufferSize:(unint64_t)a11 delay:(double)a12 currentPTS:(id *)a13 numDecodedSamples:(unint64_t)a14 numDidAnalyzeFrames:(unint64_t)a15 numDidAnalyzeFragments:(unint64_t)a16 numDidAnalyzePackages:(unint64_t)a17 numDidCreateTimelapseFragments:(unint64_t)a18 averageAnalysisTime:(double)a19 encode:(BOOL)a20 encoder:(BOOL)a21
{
  id v34;
  id v35;
  id v36;
  HMIVideoAnalyzerState *v37;
  HMIVideoAnalyzerState *v38;
  int64_t var3;
  objc_super v41;

  v34 = a3;
  v35 = a4;
  v36 = a5;
  v41.receiver = self;
  v41.super_class = (Class)HMIVideoAnalyzerState;
  v37 = -[HMIVideoAnalyzerState init](&v41, sel_init);
  v38 = v37;
  if (v37)
  {
    objc_storeStrong((id *)&v37->_configuration, a3);
    objc_storeStrong((id *)&v38->_dynamicConfiguration, a4);
    objc_storeStrong((id *)&v38->_identifier, a5);
    v38->_monitored = a6;
    v38->_analysisFPS = a7;
    v38->_timeSinceAnalyzerStarted = a8;
    v38->_timeSinceLastFragmentWasReceived = a9;
    v38->_bufferFillRatio = a10;
    v38->_bufferSize = a11;
    v38->_delay = a12;
    var3 = a13->var3;
    *(_OWORD *)&v38->_currentPTS.value = *(_OWORD *)&a13->var0;
    v38->_currentPTS.epoch = var3;
    v38->_numDecodedSamples = a14;
    v38->_numDidAnalyzeFrames = a15;
    v38->_numDidAnalyzeFragments = a16;
    v38->_numDidAnalyzePackages = a17;
    v38->_numDidCreateTimelapseFragments = a18;
    v38->_averageAnalysisTime = a19;
    v38->_encode = a20;
    v38->_encoder = a21;
  }

  return v38;
}

- (NSArray)tableColumns
{
  return (NSArray *)&unk_24DC152D8;
}

- (NSArray)tableValues
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
  void *v13;
  void *v14;
  _BOOL4 v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  _BOOL4 v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  CMTime time;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerState identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMIUUIDShortDescription(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "camera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "camera");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  v15 = -[HMIVideoAnalyzerState monitored](self, "monitored");
  v16 = CFSTR("N");
  if (v15)
    v16 = CFSTR("Y");
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v17);

  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "decodeMode");

  if (v19 <= 2)
    objc_msgSend(v3, "addObject:", off_24DBEE3A8[v19]);
  v20 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState analysisFPS](self, "analysisFPS");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%.2f"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  v23 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState timeSinceAnalyzerStarted](self, "timeSinceAnalyzerStarted");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%ld"), (unint64_t)v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  v26 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState timeSinceLastFragmentWasReceived](self, "timeSinceLastFragmentWasReceived");
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%ld"), (unint64_t)v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v28);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerState bufferFillRatio](self, "bufferFillRatio");
  v31 = (int)(v30 * 10.0);
  objc_msgSend(&stru_24DBF1B40, "stringByPaddingToLength:withString:startingAtIndex:", v31, CFSTR("="), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendFormat:", CFSTR("[%@"), v32);

  objc_msgSend(&stru_24DBF1B40, "stringByPaddingToLength:withString:startingAtIndex:", 10 - v31, CFSTR(" "), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendFormat:", CFSTR("%@"), v33);

  objc_msgSend(v29, "appendFormat:", CFSTR("] %5ld KB"), -[HMIVideoAnalyzerState bufferSize](self, "bufferSize") >> 10);
  v77 = v29;
  objc_msgSend(v3, "addObject:", v29);
  v34 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState delay](self, "delay");
  objc_msgSend(v34, "stringWithFormat:", CFSTR("%.1f"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v36);

  v37 = (void *)MEMORY[0x24BDD17C8];
  v38 = -[HMIVideoAnalyzerState numDecodedSamples](self, "numDecodedSamples");
  -[HMIVideoAnalyzerState currentPTS](self, "currentPTS");
  objc_msgSend(v37, "stringWithFormat:", CFSTR("%4ld:%.1f"), v38, CMTimeGetSeconds(&time));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v39);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld, %ld"), -[HMIVideoAnalyzerState numDidAnalyzeFrames](self, "numDidAnalyzeFrames"), -[HMIVideoAnalyzerState numDidAnalyzeFragments](self, "numDidAnalyzeFragments"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v40);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), self->_numDidAnalyzePackages);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v41);

  v42 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState averageAnalysisTime](self, "averageAnalysisTime");
  objc_msgSend(v42, "stringWithFormat:", CFSTR("%.2f"), v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v44);

  v75 = (void *)MEMORY[0x24BDD17C8];
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v76, "transcode");
  v46 = -[HMIVideoAnalyzerState encode](self, "encode");
  v47 = -[HMIVideoAnalyzerState encoder](self, "encoder");
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFourCCString(objc_msgSend(v48, "transcodeCodecType"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v50;
  v52 = CFSTR("T");
  if (v50)
  {
    v53 = CFSTR("t");
    objc_msgSend(v50, "timelapseInterval");
    if ((v78 & 1) != 0)
      v53 = CFSTR("T");
  }
  else
  {
    v53 = CFSTR("t");
  }
  if (v47)
    v54 = CFSTR("C");
  else
    v54 = CFSTR("c");
  if (v46)
    v55 = CFSTR("E");
  else
    v55 = CFSTR("e");
  if (!v45)
    v52 = CFSTR("t");
  objc_msgSend(v75, "stringWithFormat:", CFSTR("%@%@%@ %@, %@:%ld"), v52, v55, v54, v49, v53, -[HMIVideoAnalyzerState numDidCreateTimelapseFragments](self, "numDidCreateTimelapseFragments"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v56);

  -[HMIVideoAnalyzerState dynamicConfiguration](self, "dynamicConfiguration");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x24BDD17C8];
  v59 = objc_msgSend(v57, "recognizeFaces");
  v60 = CFSTR("N");
  if (v59)
    v60 = CFSTR("Y");
  objc_msgSend(v58, "stringWithFormat:", CFSTR("%@"), v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v61);

  v62 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v57, "activityZones");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v63, "count"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v64);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v57, "eventTriggers");
  if ((v66 & 1) != 0)
    v67 = CFSTR("M");
  else
    v67 = CFSTR("m");
  objc_msgSend(v65, "appendString:", v67);
  if ((v66 & 2) != 0)
    v68 = CFSTR("P");
  else
    v68 = CFSTR("p");
  objc_msgSend(v65, "appendString:", v68);
  if ((v66 & 4) != 0)
    v69 = CFSTR("A");
  else
    v69 = CFSTR("a");
  objc_msgSend(v65, "appendString:", v69);
  if ((v66 & 8) != 0)
    v70 = CFSTR("V");
  else
    v70 = CFSTR("v");
  objc_msgSend(v65, "appendString:", v70);
  if ((v66 & 0x10) != 0)
    v71 = CFSTR("K");
  else
    v71 = CFSTR("k");
  objc_msgSend(v65, "appendString:", v71);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v65);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v72);

  v73 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v73;
}

- (NSDictionary)JSONObject
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[21];
  _QWORD v64[23];

  v64[21] = *MEMORY[0x24BDAC8D0];
  v63[0] = CFSTR("identifier");
  -[HMIVideoAnalyzerState identifier](self, "identifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "UUIDString");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v59;
  v63[1] = CFSTR("monitored");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMIVideoAnalyzerState monitored](self, "monitored"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v58;
  v63[2] = CFSTR("analysisFPS");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState analysisFPS](self, "analysisFPS");
  objc_msgSend(v3, "numberWithDouble:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v57, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v64[2] = v56;
  v63[3] = CFSTR("timeSinceAnalyzerStarted");
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState timeSinceAnalyzerStarted](self, "timeSinceAnalyzerStarted");
  objc_msgSend(v4, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v55, 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64[3] = v54;
  v63[4] = CFSTR("timeSinceLastFragmentWasReceived");
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState timeSinceLastFragmentWasReceived](self, "timeSinceLastFragmentWasReceived");
  objc_msgSend(v5, "numberWithDouble:");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v53, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v64[4] = v52;
  v63[5] = CFSTR("bufferFillRatio");
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState bufferFillRatio](self, "bufferFillRatio");
  objc_msgSend(v6, "numberWithDouble:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v51, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v64[5] = v50;
  v63[6] = CFSTR("bufferSize");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState bufferSize](self, "bufferSize"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v64[6] = v49;
  v63[7] = CFSTR("delay");
  v7 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState delay](self, "delay");
  objc_msgSend(v7, "numberWithDouble:");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v48, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v64[7] = v47;
  v63[8] = CFSTR("numDecodedSamples");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDecodedSamples](self, "numDecodedSamples"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v64[8] = v46;
  v63[9] = CFSTR("numDidAnalyzeFrames");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDidAnalyzeFrames](self, "numDidAnalyzeFrames"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64[9] = v45;
  v63[10] = CFSTR("numDidAnalyzePackages");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDidAnalyzePackages](self, "numDidAnalyzePackages"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v64[10] = v44;
  v63[11] = CFSTR("numDidCreateTimelapseFragments");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMIVideoAnalyzerState numDidCreateTimelapseFragments](self, "numDidCreateTimelapseFragments"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v64[11] = v43;
  v63[12] = CFSTR("averageAnalysisTime");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState averageAnalysisTime](self, "averageAnalysisTime");
  objc_msgSend(v8, "numberWithDouble:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  HMIJSONDecimalNumberForNumber(v42, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v64[12] = v41;
  v63[13] = CFSTR("decodeMode");
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  HMIVideoAnalyzerDecodeModeAsString(objc_msgSend(v40, "decodeMode"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v64[13] = v39;
  v63[14] = CFSTR("transcode");
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithBool:", objc_msgSend(v38, "transcode"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v64[14] = v37;
  v63[15] = CFSTR("transcodeCodecType");
  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  HMIFourCCString(objc_msgSend(v36, "transcodeCodecType"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v64[15] = v35;
  v63[16] = CFSTR("encode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMIVideoAnalyzerState encode](self, "encode"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v64[16] = v34;
  v63[17] = CFSTR("encoder");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMIVideoAnalyzerState encoder](self, "encoder"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64[17] = v33;
  v63[18] = CFSTR("recognizeFaces");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState dynamicConfiguration](self, "dynamicConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "recognizeFaces"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v64[18] = v12;
  v63[19] = CFSTR("activityZones");
  v13 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState dynamicConfiguration](self, "dynamicConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activityZones");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64[19] = v16;
  v63[20] = CFSTR("eventTriggers");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[HMIVideoAnalyzerState dynamicConfiguration](self, "dynamicConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "eventTriggers"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v64[20] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");

  -[HMIVideoAnalyzerState configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "camera");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v61[0] = CFSTR("name");
    -[HMIVideoAnalyzerState configuration](self, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "camera");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = CFSTR("manufacturer");
    v62[0] = v26;
    -[HMIVideoAnalyzerState configuration](self, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "camera");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "manufacturer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, CFSTR("camera"));

  }
  v31 = (void *)objc_msgSend(v21, "copy");

  return (NSDictionary *)v31;
}

- (void)check
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnalyzerState timeSinceLastFragmentWasReceived](self, "timeSinceLastFragmentWasReceived");
  if (v3 > 60.0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Session has not received any new data for over 60 seconds."));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMISimulateCrash(CFSTR("Session Check"), v5, 1);

  }
}

- (HMIVideoAnalyzerConfiguration)configuration
{
  return (HMIVideoAnalyzerConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (HMIVideoAnalyzerDynamicConfiguration)dynamicConfiguration
{
  return (HMIVideoAnalyzerDynamicConfiguration *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)monitored
{
  return self->_monitored;
}

- (double)analysisFPS
{
  return self->_analysisFPS;
}

- (double)timeSinceAnalyzerStarted
{
  return self->_timeSinceAnalyzerStarted;
}

- (double)timeSinceLastFragmentWasReceived
{
  return self->_timeSinceLastFragmentWasReceived;
}

- (double)bufferFillRatio
{
  return self->_bufferFillRatio;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (double)delay
{
  return self->_delay;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPTS
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_currentPTS, 24, 1, 0);
  return result;
}

- (unint64_t)numDecodedSamples
{
  return self->_numDecodedSamples;
}

- (unint64_t)numDidAnalyzeFrames
{
  return self->_numDidAnalyzeFrames;
}

- (unint64_t)numDidAnalyzeFragments
{
  return self->_numDidAnalyzeFragments;
}

- (unint64_t)numDidAnalyzePackages
{
  return self->_numDidAnalyzePackages;
}

- (unint64_t)numDidCreateTimelapseFragments
{
  return self->_numDidCreateTimelapseFragments;
}

- (double)averageAnalysisTime
{
  return self->_averageAnalysisTime;
}

- (BOOL)encode
{
  return self->_encode;
}

- (BOOL)encoder
{
  return self->_encoder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dynamicConfiguration, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
