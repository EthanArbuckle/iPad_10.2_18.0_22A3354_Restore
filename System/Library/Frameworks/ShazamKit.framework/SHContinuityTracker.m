@implementation SHContinuityTracker

+ (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4 configuration:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a1, "trackQuerySignature:inReferenceSignature:usingMergePolicy:configuration:error:", a3, a4, 1, a5, a6);
}

+ (id)trackQuerySignature:(id)a3 inReferenceSignature:(id)a4 usingMergePolicy:(int64_t)a5 configuration:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  char v31;
  char v32;
  int v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;
  _QWORD v55[3];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_msgSend(v12, "duration");
  if (v15 < 2.0 || (objc_msgSend(v13, "duration"), v16 < 2.0))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "duration");
    v19 = v18;
    objc_msgSend(v13, "duration");
    objc_msgSend(v17, "stringWithFormat:", CFSTR("Duration of query signature: %f or reference signature: %f is less than the minimum required duration for tracking: %f"), v19, v20, 0x4000000000000000);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v54 = *MEMORY[0x24BDD0FC8];
    v55[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    +[SHError annotateClientError:code:underlyingError:keyOverrides:](SHError, "annotateClientError:code:underlyingError:keyOverrides:", a7, 201, 0, v22);
LABEL_4:
    v23 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v12, "dataRepresentation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dataRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v14, "numHistogramBuckets");
  objc_msgSend(v14, "scoreThreshold");
  v27 = v26;
  v44 = objc_msgSend(v14, "boundingBox");
  objc_msgSend(v14, "frequencyPenaltyMultiplier");
  v29 = v28;
  v30 = objc_msgSend(v14, "forwardPassOnly");
  v31 = objc_msgSend(v14, "singlePassOnly");
  v32 = objc_msgSend(v14, "refineStartEnd");
  objc_msgSend(v14, "queryThreshold");
  LODWORD(v34) = v33;
  v52 = 0;
  BYTE1(v43) = v32;
  LOBYTE(v43) = v31;
  LODWORD(v35) = v27;
  LODWORD(v36) = v29;
  +[SignatureAlignmentTracker compareQuerySignature:withReferenceSignature:mergeMode:numHistogramBuckets:scoreThreshold:boundingBox:frequencyPenaltyMultiplier:forwardPassOnly:singlePassOnly:refineStartEnd:queryThreshold:error:](SignatureAlignmentTracker, "compareQuerySignature:withReferenceSignature:mergeMode:numHistogramBuckets:scoreThreshold:boundingBox:frequencyPenaltyMultiplier:forwardPassOnly:singlePassOnly:refineStartEnd:queryThreshold:error:", v46, v25, a5, v45, v44, v30, v35, v36, v34, v43, &v52);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v52;

  if (!v22)
  {
    +[SHError annotateClientError:code:underlyingError:](SHError, "annotateClientError:code:underlyingError:", a7, 200, v21);
    goto LABEL_4;
  }
  v47 = v13;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v22 = v22;
  v38 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v49;
    do
    {
      v41 = 0;
      do
      {
        if (*(_QWORD *)v49 != v40)
          objc_enumerationMutation(v22);
        objc_msgSend(a1, "buildSignatureAlignment:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v41));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v42);

        ++v41;
      }
      while (v39 != v41);
      v39 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v39);
  }

  v23 = (void *)objc_msgSend(v37, "copy");
  v13 = v47;
LABEL_5:

  return v23;
}

+ (id)buildSignatureAlignment:(id)a3
{
  id v3;
  SHRange *v4;
  double v5;
  double v6;
  double v7;
  SHRange *v8;
  SHRange *v9;
  double v10;
  double v11;
  double v12;
  SHRange *v13;
  SHSignatureAlignment *v14;
  int v15;
  double v16;
  SHSignatureAlignment *v17;

  v3 = a3;
  v4 = [SHRange alloc];
  objc_msgSend(v3, "queryStart");
  v6 = v5;
  objc_msgSend(v3, "queryEnd");
  v8 = -[SHRange initWithLowerBound:upperBound:](v4, "initWithLowerBound:upperBound:", v6, v7);
  v9 = [SHRange alloc];
  objc_msgSend(v3, "referenceStart");
  v11 = v10;
  objc_msgSend(v3, "referenceEnd");
  v13 = -[SHRange initWithLowerBound:upperBound:](v9, "initWithLowerBound:upperBound:", v11, v12);
  v14 = [SHSignatureAlignment alloc];
  objc_msgSend(v3, "confidence");
  LODWORD(v11) = v15;

  LODWORD(v16) = LODWORD(v11);
  v17 = -[SHSignatureAlignment initWithQueryRange:referenceRange:alignmentConfidence:](v14, "initWithQueryRange:referenceRange:alignmentConfidence:", v8, v13, v16);

  return v17;
}

@end
