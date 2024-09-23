uint64_t FigCaptureStreamFocusingMethodIsPhaseDetectionBased(int a1)
{
  if ((a1 - 4) > 8)
    return 0;
  else
    return byte_2065F3E56[a1 - 4];
}

uint64_t FigCaptureStreamFocusingMethodIsContrastBased(int a1)
{
  if ((a1 - 1) > 9)
    return 0;
  else
    return byte_2065F3E4C[a1 - 1];
}

uint64_t FigCaptureComputeImageGainFromMetadata(const __CFDictionary *a1, float *a2)
{
  const __CFNumber *Value;
  const __CFNumber *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  unsigned int valuePtr;
  float v12;

  v12 = 1.0664;
  v10 = 256;
  valuePtr = 256;
  v9 = 256;
  if (!a1)
    return 4294954516;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("AGC"));
  if (!Value)
    return 4294954516;
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  v5 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("sensorDGain"));
  if (!v5)
    return 4294954516;
  CFNumberGetValue(v5, kCFNumberIntType, &v10);
  v6 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("ispDGain"));
  if (!v6)
    return 4294954516;
  CFNumberGetValue(v6, kCFNumberIntType, &v9);
  v7 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("ispDGainRangeExpansionFactor"));
  if (!v7)
    return 4294954516;
  CFNumberGetValue(v7, kCFNumberFloat32Type, &v12);
  if (v12 <= 0.0)
    return 4294954516;
  result = 0;
  *a2 = (float)((float)((float)valuePtr * (float)v10) * (float)v9) / (float)(v12 * 16777000.0);
  return result;
}

CFArrayRef FigCaptureCopySerializableKeys()
{
  void *v0;
  void *v1;
  void *v2;
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
  const __CFAllocator *v19;
  void *values[417];

  values[416] = *(void **)MEMORY[0x24BDAC8D0];
  values[0] = CFSTR("MetadataDictionary");
  values[1] = CFSTR("AEAverage");
  values[2] = CFSTR("AGC");
  values[3] = CFSTR("ExposureTime");
  values[4] = CFSTR("SNR");
  values[5] = CFSTR("SensorID");
  values[6] = CFSTR("TemporalMotion");
  values[7] = CFSTR("ispDGain");
  values[8] = CFSTR("sensorDGain");
  values[9] = CFSTR("Translation");
  values[10] = CFSTR("TransformMatrix");
  values[11] = CFSTR("MotionDataError");
  values[12] = CFSTR("Acceleration");
  values[13] = CFSTR("Attitude");
  values[14] = CFSTR("{Diagnostic}");
  values[15] = CFSTR("DeviceConfiguration");
  values[16] = CFSTR("Defaults");
  values[17] = CFSTR("com.apple.avfoundation");
  values[18] = CFSTR("com.apple.coremedia");
  values[19] = CFSTR("BuildVersion");
  values[20] = CFSTR("DeviceModelName");
  values[21] = CFSTR("DeviceSerialNumber");
  values[22] = CFSTR("Version-AVFCapture");
  values[23] = CFSTR("Version-CMCapture");
  values[24] = CFSTR("Version-CMCaptureCore");
  values[25] = CFSTR("Build");
  values[26] = CFSTR("{PrivateClientMetadata}");
  values[27] = CFSTR("CaptureFolderClientPath");
  v0 = (void *)*MEMORY[0x24BDD9698];
  values[28] = CFSTR("FilteredDetectedObjectInfo");
  values[29] = v0;
  v1 = (void *)*MEMORY[0x24BDD9570];
  values[30] = *(void **)MEMORY[0x24BDD9470];
  values[31] = v1;
  v2 = (void *)*MEMORY[0x24BDD9518];
  values[32] = *(void **)MEMORY[0x24BDD9510];
  values[33] = v2;
  v3 = (void *)*MEMORY[0x24BDD9538];
  values[34] = *(void **)MEMORY[0x24BDD9498];
  values[35] = v3;
  v4 = (void *)*MEMORY[0x24BDD93E0];
  values[36] = *(void **)MEMORY[0x24BDD94A0];
  values[37] = v4;
  v5 = (void *)*MEMORY[0x24BDD9550];
  values[38] = *(void **)MEMORY[0x24BDD94C0];
  values[39] = v5;
  v6 = (void *)*MEMORY[0x24BDD94B8];
  values[40] = *(void **)MEMORY[0x24BDD9530];
  values[41] = v6;
  v7 = (void *)*MEMORY[0x24BDD9458];
  v8 = (void *)*MEMORY[0x24BDD9578];
  v9 = (void *)*MEMORY[0x24BDD94C8];
  values[44] = *(void **)MEMORY[0x24BDD94B0];
  values[45] = v9;
  v10 = (void *)*MEMORY[0x24BDD9490];
  values[46] = *(void **)MEMORY[0x24BDD94F0];
  values[47] = v10;
  v11 = (void *)*MEMORY[0x24BDD9528];
  values[48] = *(void **)MEMORY[0x24BDD94A8];
  values[49] = v11;
  v12 = (void *)*MEMORY[0x24BDD9488];
  values[50] = *(void **)MEMORY[0x24BDD9520];
  values[51] = v12;
  values[42] = v7;
  values[43] = v8;
  v13 = (void *)*MEMORY[0x24BDD9478];
  values[52] = v8;
  values[53] = v13;
  v14 = (void *)*MEMORY[0x24BDD94D0];
  values[54] = *(void **)MEMORY[0x24BDD94E0];
  values[55] = v14;
  v15 = (void *)*MEMORY[0x24BDD9480];
  values[56] = *(void **)MEMORY[0x24BDD94D8];
  values[57] = v15;
  v16 = (void *)*MEMORY[0x24BDD93F0];
  values[58] = *(void **)MEMORY[0x24BDD93F8];
  values[59] = v16;
  v17 = (void *)*MEMORY[0x24BDD9438];
  values[60] = *(void **)MEMORY[0x24BDD9430];
  values[61] = v17;
  v18 = (void *)*MEMORY[0x24BDD9410];
  values[62] = *(void **)MEMORY[0x24BDD9428];
  values[63] = v18;
  values[64] = *(void **)MEMORY[0x24BDD9420];
  values[65] = *(void **)MEMORY[0x24BDD9408];
  values[66] = *(void **)MEMORY[0x24BDD9400];
  values[67] = *(void **)MEMORY[0x24BDD9418];
  values[68] = *(void **)MEMORY[0x24BDD93E8];
  values[69] = *(void **)MEMORY[0x24BDD9468];
  values[70] = *(void **)MEMORY[0x24BDD9460];
  values[71] = *(void **)MEMORY[0x24BDD9560];
  values[72] = *(void **)MEMORY[0x24BDD9558];
  values[73] = *(void **)MEMORY[0x24BDD94F8];
  values[74] = *(void **)MEMORY[0x24BDD9508];
  values[75] = *(void **)MEMORY[0x24BDD9500];
  values[76] = *(void **)MEMORY[0x24BDD9450];
  values[77] = *(void **)MEMORY[0x24BDD9548];
  values[78] = *(void **)MEMORY[0x24BDD9540];
  values[79] = *(void **)MEMORY[0x24BDD9448];
  values[80] = *(void **)MEMORY[0x24BDD9210];
  values[81] = CFSTR("Regions");
  values[82] = CFSTR("RollingShutterSkew");
  values[83] = CFSTR("AWBGGain");
  values[84] = CFSTR("RawMetaData");
  values[85] = CFSTR("AFStatus");
  values[86] = CFSTR("Histogram_RChannel");
  values[87] = CFSTR("Histogram_GChannel");
  values[88] = CFSTR("Histogram_BChannel");
  values[89] = CFSTR("Histogram_YChannel");
  values[90] = CFSTR("CurrentFocusPosition");
  values[91] = CFSTR("AEMatrix");
  values[92] = CFSTR("BrightnessValue");
  values[93] = CFSTR("AFStable");
  values[94] = CFSTR("AEStable");
  values[95] = CFSTR("AELimitsReached");
  values[96] = CFSTR("AWBRGain");
  values[97] = CFSTR("FocusPeakSumArray");
  values[98] = CFSTR("ExposureBias");
  values[99] = CFSTR("Fnumber");
  values[100] = CFSTR("NormalizedSNR");
  values[101] = CFSTR("FocusWindow");
  values[102] = CFSTR("FocusScoresArray");
  values[103] = CFSTR("GlobalShutterFlag");
  values[104] = CFSTR("AWBStable");
  values[105] = CFSTR("ISOSpeedRating");
  values[106] = CFSTR("AWBBGain");
  values[107] = CFSTR("FlashMode");
  values[108] = CFSTR("PortType");
  values[109] = CFSTR("BracketedCaptureSequenceNumber");
  values[110] = CFSTR("LuxLevel");
  values[111] = CFSTR("AverageFocusScore");
  values[112] = CFSTR("CurrentFrameRate");
  values[113] = CFSTR("CameraDriverName");
  values[114] = CFSTR("PreBracketingFrame");
  values[115] = CFSTR("FlashCaptureSequence");
  values[116] = CFSTR("ReadNoise_1x");
  values[117] = CFSTR("ReadNoise_8x");
  values[118] = CFSTR("RawSensorWidth");
  values[119] = CFSTR("RawSensorHeight");
  values[120] = CFSTR("SensorTemperature");
  values[121] = CFSTR("RawCropRect");
  values[122] = CFSTR("ConversionGain");
  values[123] = CFSTR("AETarget");
  values[124] = CFSTR("ISOBase");
  values[125] = CFSTR("DetectedFacesArray");
  values[126] = CFSTR("FaceID");
  values[127] = CFSTR("Timestamp");
  values[128] = CFSTR("AngleInfoRoll");
  values[129] = CFSTR("AngleInfoYaw");
  values[130] = CFSTR("AngleInfoPitch");
  values[131] = CFSTR("ConfidenceLevel");
  values[132] = CFSTR("Rect");
  values[133] = CFSTR("LeftEyeRect");
  values[134] = CFSTR("RightEyeRect");
  values[135] = CFSTR("DetectedObjectsInfo");
  values[136] = CFSTR("HumanFaces");
  values[137] = CFSTR("HumanHands");
  values[138] = CFSTR("HumanBodies");
  values[139] = CFSTR("HumanFullBodies");
  values[140] = CFSTR("HumanHeads");
  values[141] = CFSTR("CatBodies");
  values[142] = CFSTR("CatHeads");
  values[143] = CFSTR("DogBodies");
  values[144] = CFSTR("DogHeads");
  values[145] = CFSTR("SalientObjects");
  values[146] = CFSTR("SportsBalls");
  values[147] = CFSTR("OriginalTimestamp");
  values[148] = CFSTR("ObjectsArray");
  values[149] = CFSTR("ID");
  values[150] = CFSTR("GroupID");
  values[151] = CFSTR("Modality");
  values[152] = CFSTR("HeatMap");
  values[153] = CFSTR("Map");
  values[154] = CFSTR("Width");
  values[155] = CFSTR("Height");
  values[156] = CFSTR("BytesPerRow");
  values[157] = CFSTR("FaceMetadataObjectsArray");
  values[158] = CFSTR("FaceMetadataObjectsCount");
  values[159] = CFSTR("IsFixedPlaneFocus");
  values[160] = CFSTR("IsHardFocus");
  values[161] = CFSTR("HistogramData");
  values[162] = CFSTR("LumaHistogramData");
  values[163] = CFSTR("BarcodeMetadataObjectsArray");
  values[164] = CFSTR("BarcodeMetadataObjectsCount");
  values[165] = CFSTR("SceneStable");
  values[166] = CFSTR("SceneStabilityMetric");
  values[167] = CFSTR("TrackedFaces");
  values[168] = CFSTR("meta");
  values[169] = CFSTR("version");
  values[170] = CFSTR("tracked_faces");
  values[171] = CFSTR("face_id");
  values[172] = CFSTR("animation");
  values[173] = CFSTR("blendshapes");
  values[174] = CFSTR("left_eye_pitch");
  values[175] = CFSTR("left_eye_yaw");
  values[176] = CFSTR("right_eye_pitch");
  values[177] = CFSTR("right_eye_yaw");
  values[178] = CFSTR("pose");
  values[179] = CFSTR("geometry");
  values[180] = CFSTR("vertices");
  values[181] = CFSTR("left_eye");
  values[182] = CFSTR("right_eye");
  values[183] = CFSTR("look_at_point");
  values[184] = CFSTR("landmarks");
  values[185] = CFSTR("debug");
  values[186] = CFSTR("identity_coefficients");
  values[187] = CFSTR("blendshape_names");
  values[188] = CFSTR("landmark_names");
  values[189] = CFSTR("mesh");
  values[190] = CFSTR("mesh_vertices");
  values[191] = CFSTR("mesh_normals");
  values[192] = CFSTR("mesh_tri_indices");
  values[193] = CFSTR("mesh_quad_indices");
  values[194] = CFSTR("rotation");
  values[195] = CFSTR("translation");
  values[196] = CFSTR("rgb_camera");
  values[197] = CFSTR("intrinsics");
  values[198] = CFSTR("extrinsics");
  values[199] = CFSTR("raw_data");
  values[200] = CFSTR("smooth_data");
  values[201] = CFSTR("timestamp");
  values[202] = CFSTR("RgbMetaData");
  values[203] = CFSTR("TotalGain");
  values[204] = CFSTR("confidence");
  values[205] = CFSTR("data_failure");
  values[206] = CFSTR("image_too_dark");
  values[207] = CFSTR("sensor_covered");
  values[208] = CFSTR("Timestamp");
  values[209] = CFSTR("BarcodeDecodeData");
  values[210] = CFSTR("BarcodeRawData");
  values[211] = CFSTR("BarcodeType");
  values[212] = CFSTR("CodeLocation");
  values[213] = CFSTR("LocatorPoints");
  values[214] = CFSTR("DecodeConfidence");
  values[215] = CFSTR("CodeProperties");
  values[216] = CFSTR("BarcodeRect");
  values[217] = CFSTR("BarcodeCorners");
  values[218] = CFSTR("SymbolVersion");
  values[219] = CFSTR("QRMASK");
  values[220] = CFSTR("ErrorCorrectionLevel");
  values[221] = CFSTR("AztecDataIsCompact");
  values[222] = CFSTR("AztecDataLayers");
  values[223] = CFSTR("AztecDataCodewords");
  values[224] = CFSTR("DataMatrixECC");
  values[225] = CFSTR("ModulesWide");
  values[226] = CFSTR("ModulesHigh");
  values[227] = CFSTR("PDF417IsCompact");
  values[228] = CFSTR("DataCodewordsWide");
  values[229] = CFSTR("DataCodewordsHigh");
  values[230] = CFSTR("ClientSpecifiedMetadata");
  values[231] = CFSTR("ClientSpecifiedDebugMetadata");
  values[232] = CFSTR("OfflineVideoStabilizationMetadata");
  values[233] = CFSTR("StreamReadyForPanoramaCapture");
  values[234] = CFSTR("AELocked");
  values[235] = CFSTR("AFLocked");
  values[236] = CFSTR("AWBLocked");
  values[237] = CFSTR("DynamicToneCurveLocked");
  values[238] = CFSTR("FramePTS");
  values[239] = CFSTR("MotionData");
  values[240] = CFSTR("ScalingFactor");
  values[241] = CFSTR("FusedMotion");
  values[242] = CFSTR("AELimitCurrentToBaseExposureRatio");
  values[243] = CFSTR("LTMLocked");
  values[244] = CFSTR("AWBComputedRGain");
  values[245] = CFSTR("AWBComputedGGain");
  values[246] = CFSTR("AWBComputedBGain");
  values[247] = CFSTR("CriticalFocusErrorOccurred");
  values[248] = CFSTR("LowLightBinnedModeActive");
  values[249] = CFSTR("OriginalPresentationTimeStamp");
  values[250] = *(void **)MEMORY[0x24BDD9670];
  values[251] = CFSTR("1");
  values[252] = CFSTR("2");
  values[253] = CFSTR("3");
  values[254] = CFSTR("4");
  values[255] = CFSTR("5");
  values[256] = CFSTR("6");
  values[257] = CFSTR("7");
  values[258] = CFSTR("8");
  values[259] = CFSTR("9");
  values[260] = CFSTR("10");
  values[261] = CFSTR("40");
  values[262] = CFSTR("11");
  values[263] = CFSTR("12");
  values[264] = CFSTR("13");
  values[265] = CFSTR("14");
  values[266] = CFSTR("15");
  values[267] = CFSTR("16");
  values[268] = CFSTR("17");
  values[269] = CFSTR("18");
  values[270] = CFSTR("19");
  values[271] = CFSTR("20");
  values[272] = CFSTR("21");
  values[273] = CFSTR("22");
  values[274] = CFSTR("23");
  values[275] = CFSTR("24");
  values[276] = CFSTR("25");
  values[277] = CFSTR("26");
  values[278] = CFSTR("27");
  values[279] = CFSTR("28");
  values[280] = CFSTR("29");
  values[281] = CFSTR("30");
  values[282] = CFSTR("31");
  values[283] = CFSTR("32");
  values[284] = CFSTR("33");
  values[285] = CFSTR("34");
  values[286] = CFSTR("35");
  values[287] = CFSTR("36");
  values[288] = CFSTR("37");
  values[289] = CFSTR("38");
  values[290] = CFSTR("39");
  values[291] = CFSTR("41");
  values[292] = CFSTR("42");
  values[293] = CFSTR("43");
  values[294] = CFSTR("44");
  values[295] = CFSTR("45");
  values[296] = CFSTR("46");
  values[297] = CFSTR("47");
  values[298] = CFSTR("48");
  values[299] = CFSTR("49");
  values[300] = CFSTR("50");
  values[301] = CFSTR("51");
  values[302] = CFSTR("52");
  values[303] = CFSTR("53");
  values[304] = CFSTR("54");
  values[305] = CFSTR("55");
  values[306] = CFSTR("56");
  values[307] = CFSTR("57");
  values[308] = CFSTR("58");
  values[309] = CFSTR("59");
  values[310] = CFSTR("60");
  values[311] = CFSTR("61");
  values[312] = CFSTR("62");
  values[313] = CFSTR("63");
  values[314] = CFSTR("64");
  values[315] = CFSTR("65");
  values[316] = CFSTR("66");
  values[317] = CFSTR("67");
  values[318] = CFSTR("68");
  values[319] = CFSTR("69");
  values[320] = CFSTR("70");
  values[321] = CFSTR("71");
  values[322] = CFSTR("72");
  values[323] = CFSTR("73");
  values[324] = CFSTR("74");
  values[325] = CFSTR("75");
  values[326] = CFSTR("77");
  values[327] = CFSTR("78");
  values[328] = CFSTR("79");
  values[329] = CFSTR("80");
  values[330] = CFSTR("81");
  values[331] = CFSTR("82");
  values[332] = CFSTR("83");
  values[333] = CFSTR("84");
  values[334] = CFSTR("85");
  values[335] = CFSTR("87");
  values[336] = CFSTR("90");
  values[337] = *(void **)MEMORY[0x24BDD96E8];
  values[338] = *(void **)MEMORY[0x24BDD9700];
  values[339] = *(void **)MEMORY[0x24BDD9708];
  values[340] = *(void **)MEMORY[0x24BDD9720];
  values[341] = *(void **)MEMORY[0x24BDD96F0];
  values[342] = *(void **)MEMORY[0x24BDD96E0];
  values[343] = *(void **)MEMORY[0x24BDD9728];
  values[344] = *(void **)MEMORY[0x24BDD9730];
  values[345] = *(void **)MEMORY[0x24BDD9718];
  values[346] = *(void **)MEMORY[0x24BDD93C8];
  values[347] = *(void **)MEMORY[0x24BDD93C0];
  values[348] = *(void **)MEMORY[0x24BDD9360];
  values[349] = *(void **)MEMORY[0x24BDD93A0];
  values[350] = *(void **)MEMORY[0x24BDD9300];
  values[351] = *(void **)MEMORY[0x24BDD9398];
  values[352] = *(void **)MEMORY[0x24BDD9378];
  values[353] = *(void **)MEMORY[0x24BDD9370];
  values[354] = *(void **)MEMORY[0x24BDD9320];
  values[355] = *(void **)MEMORY[0x24BDD93B8];
  values[356] = *(void **)MEMORY[0x24BDD9328];
  values[357] = *(void **)MEMORY[0x24BDD9330];
  values[358] = *(void **)MEMORY[0x24BDD9350];
  values[359] = *(void **)MEMORY[0x24BDD9358];
  values[360] = *(void **)MEMORY[0x24BDD9338];
  values[361] = *(void **)MEMORY[0x24BDD9340];
  values[362] = *(void **)MEMORY[0x24BDD92F0];
  values[363] = *(void **)MEMORY[0x24BDD92F8];
  values[364] = *(void **)MEMORY[0x24BDD9308];
  values[365] = *(void **)MEMORY[0x24BDD9310];
  values[366] = *(void **)MEMORY[0x24BDD9318];
  values[367] = *(void **)MEMORY[0x24BDD9388];
  values[368] = *(void **)MEMORY[0x24BDD9348];
  values[369] = *(void **)MEMORY[0x24BDD9390];
  values[370] = *(void **)MEMORY[0x24BDD9380];
  values[371] = *(void **)MEMORY[0x24BDD93B0];
  values[372] = *(void **)MEMORY[0x24BDD93A8];
  values[373] = *(void **)MEMORY[0x24BDD9368];
  values[374] = CFSTR("FlatDictionaryContent");
  values[375] = CFSTR("FlatDictionaryKeySpec");
  values[376] = CFSTR("HasCorrespondingVisionData");
  values[377] = CFSTR("SynchronizedStreamsCaptureID");
  values[378] = CFSTR("DepthMetadata");
  values[379] = CFSTR("Quality");
  values[380] = CFSTR("Filtered");
  values[381] = CFSTR("Accuracy");
  values[382] = CFSTR("IntrinsicMatrix");
  values[383] = CFSTR("IntrinsicMatrixReferenceDimensions");
  values[384] = CFSTR("ExtrinsicMatrix");
  values[385] = CFSTR("PixelSize");
  values[386] = CFSTR("LensDistortionCoefficients");
  values[387] = CFSTR("InverseLensDistortionCoefficients");
  values[388] = CFSTR("LensDistortionCenter");
  values[389] = CFSTR("DepthDataVersion");
  values[390] = CFSTR("PortraitScoreIsHigh");
  values[391] = CFSTR("PortraitScore");
  values[392] = CFSTR("SimulatedAperture");
  values[393] = CFSTR("RenderingParameters");
  values[394] = CFSTR("EffectStrength");
  values[395] = CFSTR("HasCorrespondingDepthData");
  values[396] = CFSTR("TextRegions");
  values[397] = CFSTR("TextRegionsCount");
  values[398] = CFSTR("BoundingRect");
  values[399] = CFSTR("Timestamp");
  values[400] = CFSTR("RegionID");
  values[401] = CFSTR("AngularOffset");
  values[402] = CFSTR("AngularOffsetBoundingRect");
  values[403] = CFSTR("Confidence");
  values[404] = CFSTR("com.apple.cmio.format_extension.video.only_has_i_frames");
  values[405] = CFSTR("com.apple.cmio.format_extension.muxed.video_constituent_format");
  values[406] = CFSTR("com.apple.cmio.format_extension.muxed.audio_constituent_format");
  values[407] = CFSTR("mjht");
  values[408] = CFSTR("TransportLayer");
  values[409] = CFSTR("ispDGainRangeExpansionFactor");
  values[410] = CFSTR("ScalingFactor");
  values[411] = CFSTR("TemporalNoiseReductionBand0Strength");
  values[412] = CFSTR("TemporalNoiseReductionBand0StrengthModulationEnabled");
  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values[413] = CFSTR("NormalizedSNRQsum");
  values[414] = CFSTR("88");
  values[415] = CFSTR("89");
  return CFArrayCreate(v19, (const void **)values, 416, MEMORY[0x24BDBD690]);
}

void FigStartCaptureServers()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFBundleRef BundleWithIdentifier;
  __CFBundle *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t i;
  const __CFString *v16;
  void (*FunctionPointerForName)(void);
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (_os_feature_enabled_impl())
  {
    v0 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v0)
      FigStartCaptureServers_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  else
  {
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CMCapture"));
    if (BundleWithIdentifier)
    {
      v9 = BundleWithIdentifier;
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("FigCaptureMemoryReporterStart"), CFSTR("FigExternalStorageDeviceManagerServerStart"), CFSTR("FigCapturePreloadShaders"), CFSTR("FigCaptureSourceServerStart"), CFSTR("FigCameraViewfinderServerStart"), CFSTR("FigCaptureSessionServerStart"), CFSTR("FigFlashlightServerStart"), CFSTR("FigCaptureDeferredContainerManagerServerStart"), 0);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v27;
        v14 = MEMORY[0x24BDACB70];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v27 != v13)
              objc_enumerationMutation(v10);
            v16 = *(const __CFString **)(*((_QWORD *)&v26 + 1) + 8 * i);
            FunctionPointerForName = (void (*)(void))CFBundleGetFunctionPointerForName(v9, v16);
            if (FunctionPointerForName)
            {
              FunctionPointerForName();
            }
            else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              FigStartCaptureServers_cold_3(buf, (uint64_t)v16, &v31);
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
        }
        while (v12);
      }
    }
    else
    {
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v18)
        FigStartCaptureServers_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void FigStartCaptureServers_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2065E5000, MEMORY[0x24BDACB70], a3, "Using FigStartCaptureServers() when cameracaptured is enabled is an error.  Not starting camera capture servers.", a5, a6, a7, a8, 0);
}

void FigStartCaptureServers_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2065E5000, MEMORY[0x24BDACB70], a3, "Could not find com.apple.CMCapture", a5, a6, a7, a8, 0);
}

void FigStartCaptureServers_cold_3(uint8_t *buf, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl(&dword_2065E5000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not find %@", buf, 0xCu);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x24BDBBAB8](bundle, functionName);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

