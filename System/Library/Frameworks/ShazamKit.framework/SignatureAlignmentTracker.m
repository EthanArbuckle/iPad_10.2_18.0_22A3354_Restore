@implementation SignatureAlignmentTracker

+ (id)compareQuerySignature:(id)a3 withReferenceSignature:(id)a4 mergeMode:(int64_t)a5 numHistogramBuckets:(unsigned int)a6 scoreThreshold:(float)a7 boundingBox:(unsigned int)a8 frequencyPenaltyMultiplier:(float)a9 forwardPassOnly:(BOOL)a10 singlePassOnly:(BOOL)a11 refineStartEnd:(BOOL)a12 queryThreshold:(float)a13 error:(id *)a14
{
  gsl::details *v23;
  uint64_t v24;
  gsl::details *v25;
  uint64_t v26;
  id v27;
  id v28;
  char *v29;
  char *v30;
  __int128 v31;
  __int128 v33;
  int v34;
  __int128 v35[2];
  __int128 v36;
  char *v37;
  char *v38;
  __int128 v39;
  char v40;
  float v41;
  __int16 v42;
  int v43;
  char v44;
  int v45;
  _DWORD v46[4];
  BOOL v47;
  BOOL v48;
  BOOL v49;
  __int128 v50[2];
  uint64_t v51[3];
  __int128 v52[2];
  uint64_t v53[3];

  v23 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)objc_msgSend(a4, "bytes"), (gsl::details *)objc_msgSend(a4, "length"));
  shazam::packed_signature_view::packed_signature_view(v50, v23, v24);
  shazam::basic_signature<(shazam::signature_density)16>::basic_signature(v52, v50);
  v25 = gsl::make_span<shazam::spectral_peak_compact_t const>((gsl::details *)objc_msgSend(a3, "bytes"), (gsl::details *)objc_msgSend(a3, "length"));
  shazam::packed_signature_view::packed_signature_view(&v39, v25, v26);
  shazam::basic_signature<(shazam::signature_density)24>::basic_signature(v50, &v39);
  v46[0] = a6;
  *(float *)&v46[1] = a7;
  v46[2] = a8;
  *(float *)&v46[3] = a9;
  v47 = a10;
  v48 = a11;
  v49 = a12;
  *(_QWORD *)&v39 = 0xBD4CCCCD00000000;
  BYTE8(v39) = 1;
  HIDWORD(v39) = 1028443341;
  v40 = 1;
  v41 = a13;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v36 = xmmword_218C5E5A0;
  SearchPlan::SearchPlan((uint64_t)v35, 1, 2);
  shazam::pairwise::compare(v52, v53, v50, v51, a5 != 0, (uint64_t)&v36, &v39, v35, &v37, (uint64_t)v46);
  v27 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v28 = (id)objc_msgSend(v27, "initWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((v38 - v37) >> 2));
  v29 = v37;
  v30 = v38;
  if (v37 != v38)
  {
    do
    {
      v31 = *(_OWORD *)v29;
      v34 = *((_DWORD *)v29 + 4);
      v33 = v31;
      objc_msgSend(v28, "addObject:", objc_msgSend(a1, "signatureAlignmentFromTrackingResult:", &v33));
      v29 += 20;
    }
    while (v29 != v30);
    v29 = v37;
  }
  if (v29)
  {
    v38 = v29;
    operator delete(v29);
  }
  *(_QWORD *)&v39 = v51;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
  *(_QWORD *)&v50[0] = v53;
  std::vector<std::vector<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v50);
  return (id)objc_msgSend(v28, "copy");
}

+ (id)signatureAlignmentFromTrackingResult:(TrackingResult *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  SignatureAlignmentTrackerResult *v8;
  double v9;

  v4 = (float)((float)a3->var0.var0.var0 / 125.0);
  v5 = (float)((float)a3->var0.var1.var0 / 125.0);
  v6 = (float)((float)a3->var1.var0.var0 / 125.0);
  v7 = (float)((float)a3->var1.var1.var0 / 125.0);
  v8 = [SignatureAlignmentTrackerResult alloc];
  *(float *)&v9 = a3->var2;
  return -[SignatureAlignmentTrackerResult initWithQueryStart:queryEnd:referenceStart:referenceEnd:confidence:](v8, "initWithQueryStart:queryEnd:referenceStart:referenceEnd:confidence:", v4, v5, v6, v7, v9);
}

+ (BOOL)ConvertSystemError:(const system_error *)a3 toError:(id *)a4
{
  uint64_t v6;
  uint64_t var0;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (*((uint64_t (**)(const system_error *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    var0 = a3->var2.var0;
    v9 = *MEMORY[0x24BDD0FC8];
    v10[0] = v6;
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigalignmenttracker"), var0, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
  return a4 != 0;
}

+ (BOOL)ConvertException:(const exception *)a3 toError:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", (*((uint64_t (**)(const exception *, SEL))a3->var0 + 2))(a3, a2), objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding"));
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = v5;
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigalignmenttracker"), -100, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  }
  return a4 != 0;
}

+ (BOOL)FillUnknownError:(id *)a3
{
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = *MEMORY[0x24BDD0FC8];
    v6[0] = CFSTR("Something unexpected happened.");
    *a3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.shazam.sigalignmenttracker"), -200, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1));
  }
  return a3 != 0;
}

@end
