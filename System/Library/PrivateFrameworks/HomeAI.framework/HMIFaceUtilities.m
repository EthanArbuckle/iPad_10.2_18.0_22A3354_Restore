@implementation HMIFaceUtilities

+ (unint64_t)faceprintDefaultRevision
{
  return 3737841670;
}

+ (unint64_t)faceprintAttributeDefaultRevision
{
  return 3737841670;
}

+ (id)faceObservationsFromFaceprintsForClustering:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  double v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDF9BB8], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 2, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_alloc(MEMORY[0x24BDF9BC8]);
        objc_msgSend(v11, "data");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = objc_msgSend(v14, "bytes");
        v16 = +[HMIFaceUtilities faceprintDefaultRevision](HMIFaceUtilities, "faceprintDefaultRevision");
        LODWORD(v17) = 1.0;
        v18 = (void *)objc_msgSend(v13, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v15, 128, 1, 512, v16, v17);

        objc_msgSend(v12, "setFaceprint:", v18);
        objc_msgSend(v12, "setFaceId:", v10 + v9);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v7 = v10 + v9;
    }
    while (v6);
  }

  return v4;
}

+ (id)faceObservationFromTorsoprint:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;

  v3 = (objc_class *)MEMORY[0x24BDF9BC8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = objc_msgSend(v7, "bytes");
  LODWORD(v9) = 1.0;
  v10 = (void *)objc_msgSend(v5, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v8, 128, 1, 512, 3, v9);

  objc_msgSend(MEMORY[0x24BDF9BB8], "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 3, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFaceprint:", v10);

  return v11;
}

+ (id)faceObservationFromFaceprint:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDF9BB8];
  v4 = a3;
  objc_msgSend(v3, "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", 2, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDF9BC8]);
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "bytes");
  v10 = +[HMIFaceUtilities faceprintDefaultRevision](HMIFaceUtilities, "faceprintDefaultRevision");
  LODWORD(v11) = 1.0;
  v12 = (void *)objc_msgSend(v6, "initWithData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v9, 128, 1, 512, v10, v11);

  objc_msgSend(v5, "setFaceprint:", v12);
  return v5;
}

+ (id)croppedJpegDataFromFaceCrop:(id)a3
{
  id v3;
  HMIFaceprinter *v4;
  __CVBuffer *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v10;

  v3 = a3;
  v4 = objc_alloc_init(HMIFaceprinter);
  v10 = 0;
  v5 = -[HMIFaceprinter createFacePixelBufferFromFaceCrop:error:](v4, "createFacePixelBufferFromFaceCrop:error:", v3, &v10);

  if (v5)
  {
    LODWORD(v6) = 1.0;
    LODWORD(v7) = 1.0;
    +[HMIVisionUtilities createJPEGDataFromPixelBuffer:scale:encodeQuality:error:](HMIVisionUtilities, "createJPEGDataFromPixelBuffer:scale:encodeQuality:error:", v5, 0, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)mergedPersonEventsFromEvents:(id)a3
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
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  id v91;

  v3 = a3;
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_filter:", &__block_literal_global_41);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_filter:", &__block_literal_global_43);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "na_filter:", &__block_literal_global_45_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_5;
  v88[3] = &unk_24DBEB3D0;
  v13 = v11;
  v89 = v13;
  v14 = v8;
  v90 = v14;
  v15 = v10;
  v91 = v15;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v88);
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v14, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingComparator:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v12;
  v84[1] = 3221225472;
  v84[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_7;
  v84[3] = &unk_24DBEC4E8;
  v85 = v17;
  v20 = v18;
  v86 = v20;
  v21 = v14;
  v87 = v21;
  v55 = v17;
  objc_msgSend(v19, "na_each:", v84);

  v79[0] = v12;
  v79[1] = 3221225472;
  v79[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_8;
  v79[3] = &unk_24DBEC510;
  v22 = v20;
  v80 = v22;
  v23 = v5;
  v81 = v23;
  v24 = v21;
  v82 = v24;
  v25 = v16;
  v83 = v25;
  objc_msgSend(v55, "enumerateIndexesUsingBlock:", v79);
  objc_msgSend(v15, "removeAllObjects");
  v26 = MEMORY[0x24BDAC760];
  v74[0] = MEMORY[0x24BDAC760];
  v74[1] = 3221225472;
  v74[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_9;
  v74[3] = &unk_24DBEC510;
  v49 = v22;
  v75 = v49;
  v48 = v13;
  v76 = v48;
  v27 = v52;
  v77 = v27;
  v78 = v15;
  v53 = v15;
  objc_msgSend(v25, "enumerateIndexesUsingBlock:", v74);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1698], "indexSetWithIndexesInRange:", 0, objc_msgSend(v27, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v26;
  v68[1] = 3221225472;
  v68[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_11;
  v68[3] = &unk_24DBEC538;
  v32 = v25;
  v69 = v32;
  v70 = v30;
  v33 = v28;
  v71 = v33;
  v34 = v27;
  v72 = v34;
  v35 = v29;
  v73 = v35;
  v36 = v30;
  objc_msgSend(v31, "na_each:", v68);

  v37 = MEMORY[0x24BDAC760];
  v61[0] = MEMORY[0x24BDAC760];
  v61[1] = 3221225472;
  v61[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_12;
  v61[3] = &unk_24DBEC560;
  v62 = v35;
  v63 = v34;
  v38 = v33;
  v64 = v38;
  v65 = v23;
  v66 = v24;
  v67 = v32;
  v39 = v32;
  v40 = v24;
  v51 = v23;
  v50 = v34;
  v41 = v35;
  objc_msgSend(v36, "enumerateIndexesUsingBlock:", v61);
  v56[0] = v37;
  v56[1] = 3221225472;
  v56[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_13;
  v56[3] = &unk_24DBEC510;
  v57 = v48;
  v58 = v49;
  v59 = v38;
  v60 = v54;
  v42 = v54;
  v43 = v38;
  v44 = v49;
  v45 = v48;
  objc_msgSend(v39, "enumerateIndexesUsingBlock:", v56);
  v46 = (void *)objc_msgSend(v42, "copy");

  return v46;
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke()
{
  uint64_t v0;

  v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_2()
{
  uint64_t v0;

  v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_3()
{
  uint64_t v0;

  v0 = objc_opt_class();
  return v0 == objc_opt_class();
}

BOOL __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;

  v2 = a2;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class() || (v4 = objc_opt_class(), v4 == objc_opt_class()))
  {
    v6 = 0;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 != objc_opt_class();
  }

  return v6;
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_6;
  v10[3] = &unk_24DBEC4C0;
  v11 = v5;
  v8 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = a3;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  void *v31;
  HMIPairwiseMatch *v32;
  double v33;
  HMIPairwiseMatch *v34;
  id v35;

  v35 = a2;
  objc_msgSend(*(id *)(a1 + 32), "boundingBox");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v35, "boundingBox");
  HMICGRectIntersectionOverArea(v6, v8, v10, v12, v13, v14, v15, v16);
  if (v17 > 0.7)
  {
    objc_msgSend(*(id *)(a1 + 32), "boundingBox");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v35, "boundingBox");
    HMICGRectIntersectionOverUnion(v19, v21, v23, v25, v26, v27, v28, v29);
    LODWORD(v19) = v30;
    v31 = *(void **)(a1 + 40);
    v32 = [HMIPairwiseMatch alloc];
    LODWORD(v33) = LODWORD(v19);
    v34 = -[HMIPairwiseMatch initWithFirstIndex:secondIndex:score:](v32, "initWithFirstIndex:secondIndex:score:", *(_QWORD *)(a1 + 48), a3, v33);
    objc_msgSend(v31, "addObject:", v34);

  }
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v9, "secondIndex")))
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "firstIndex"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "removeIndex:", objc_msgSend(v9, "secondIndex"));
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v9, "secondIndex"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "firstIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
  }

}

uint64_t __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count") + a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  return objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "count") + a2);
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_9(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = *(void **)(a1 + 32);
  else
    v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_10;
  v12[3] = &unk_24DBEC4C0;
  v13 = v9;
  v10 = *(void **)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = a2;
  v11 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double MinX;
  double MinY;
  double Width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  HMIPairwiseMatch *v22;
  double v23;
  HMIPairwiseMatch *v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "boundingBox");
  MinX = CGRectGetMinX(v25);
  objc_msgSend(*(id *)(a1 + 32), "boundingBox");
  MinY = CGRectGetMinY(v26);
  objc_msgSend(*(id *)(a1 + 32), "boundingBox");
  Width = CGRectGetWidth(v27);
  objc_msgSend(*(id *)(a1 + 32), "boundingBox");
  v10 = CGRectGetHeight(v28) * 0.4;
  objc_msgSend(v6, "boundingBox");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  HMICGRectIntersectionOverArea(v12, v14, v16, v18, MinX, MinY, Width, v10);
  if (v19 > 0.0)
  {
    v20 = v19;
    v21 = *(void **)(a1 + 40);
    v22 = [HMIPairwiseMatch alloc];
    *(float *)&v23 = v20;
    v24 = -[HMIPairwiseMatch initWithFirstIndex:secondIndex:score:](v22, "initWithFirstIndex:secondIndex:score:", *(_QWORD *)(a1 + 48), a3, v23);
    objc_msgSend(v21, "addObject:", v24);

  }
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_11(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v18, "firstIndex"));
  v4 = v18;
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v18, "secondIndex")))
    {
      v5 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "firstIndex"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "removeIndex:", objc_msgSend(v18, "secondIndex"));
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", objc_msgSend(v18, "secondIndex"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "firstIndex"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, v14);
        goto LABEL_8;
      }
    }
    v8 = objc_msgSend(*(id *)(a1 + 40), "containsIndex:", objc_msgSend(v18, "secondIndex"));
    v4 = v18;
    if (v8)
    {
      v9 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "secondIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v18;
      if (!v11)
      {
        v12 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "firstIndex"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(a1 + 64);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "secondIndex"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

LABEL_8:
        v4 = v18;
      }
    }
  }

}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_12(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "boundingBox");
  v14 = HMICGRectArea(v10, v11, v12, v13);

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundingBox");
  v20 = HMICGRectArea(v16, v17, v18, v19);

  if (v20 * 9.0 >= v14)
  {
LABEL_3:
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 56), "count") + a2 + objc_msgSend(*(id *)(a1 + 64), "count"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

    objc_msgSend(*(id *)(a1 + 72), "addIndex:", objc_msgSend(*(id *)(a1 + 56), "count") + a2 + objc_msgSend(*(id *)(a1 + 64), "count"));
  }
}

void __49__HMIFaceUtilities_mergedPersonEventsFromEvents___block_invoke_13(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMIVideoAnalyzerEventPerson *v12;
  void *v13;
  HMIVideoAnalyzerEventPerson *v14;
  HMIVideoAnalyzerEventPerson *v15;
  id v16;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v12 = [HMIVideoAnalyzerEventPerson alloc];
    objc_msgSend(v16, "confidence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "boundingBox");
    v14 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:torso:](v12, "initWithConfidence:boundingBox:face:torso:", v13, v11, v8);

    if (!v14)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v11 && v8)
  {
    v15 = -[HMIVideoAnalyzerEventPerson initWithFaceEvent:torso:]([HMIVideoAnalyzerEventPerson alloc], "initWithFaceEvent:torso:", v11, v8);
  }
  else if (!v11 || v8)
  {
    if (v11 || !v8)
      goto LABEL_15;
    v15 = -[HMIVideoAnalyzerEventPerson initWithTorsoEvent:]([HMIVideoAnalyzerEventPerson alloc], "initWithTorsoEvent:", v8);
  }
  else
  {
    v15 = -[HMIVideoAnalyzerEventPerson initWithFaceEvent:]([HMIVideoAnalyzerEventPerson alloc], "initWithFaceEvent:", v11);
  }
  v14 = v15;
  if (v15)
  {
LABEL_14:
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);

  }
LABEL_15:

}

+ (BOOL)saveFaceClassifications:(id)a3 videoId:(id)a4 fragmentId:(unint64_t)a5 frameId:(id)a6 baseURL:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  void *v54;
  BOOL v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id *v64;
  id obj;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  _QWORD v96[6];
  _QWORD v97[6];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v76 = a4;
  v75 = a6;
  v13 = a7;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  LOBYTE(a4) = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v91);
  v16 = v91;

  if ((a4 & 1) != 0)
  {
    v64 = a8;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = v12;
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (!v68)
    {
      v55 = 1;
      goto LABEL_37;
    }
    v66 = *(_QWORD *)v88;
    v67 = v12;
    v84 = v13;
LABEL_4:
    v17 = 0;
    v18 = v16;
    while (1)
    {
      v82 = v18;
      if (*(_QWORD *)v88 != v66)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v17);
      v97[0] = CFSTR("0.1");
      v96[0] = CFSTR("version");
      v96[1] = CFSTR("personUUID");
      objc_msgSend(v19, "personUUID");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      if (v80)
      {
        objc_msgSend(v19, "personUUID");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "UUIDString");
        v20 = objc_claimAutoreleasedReturnValue();
        v70 = (void *)v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v20 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v20;
      }
      v97[1] = v20;
      v96[2] = CFSTR("sourceUUID");
      objc_msgSend(v19, "sourceUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v17;
      if (v21)
      {
        objc_msgSend(v19, "sourceUUID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "UUIDString");
        v22 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)v22;
        v23 = v77;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
      }
      v97[2] = v22;
      v96[3] = CFSTR("faceCropUUID");
      objc_msgSend(v19, "faceCrop");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v97[3] = v26;
      v96[4] = CFSTR("faceprintUUID");
      objc_msgSend(v19, "faceprint");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v97[4] = v29;
      v96[5] = CFSTR("confidence");
      v30 = (void *)MEMORY[0x24BDD16E0];
      v85 = v19;
      objc_msgSend(v19, "confidence");
      objc_msgSend(v30, "numberWithDouble:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v97[5] = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 6);
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v23;
      if (v21)
      {

        v32 = v73;
      }
      v77 = v23;

      v33 = v74;
      if (v80)
      {

        v33 = v72;
      }

      v81 = (void *)MEMORY[0x24BDD17C8];
      v79 = objc_msgSend(v75, "intValue");
      objc_msgSend(v19, "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34 ? CFSTR("known") : CFSTR("unknown");
      objc_msgSend(v19, "faceCrop");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "UUIDString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "substringToIndex:", 8);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "sourceUUID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "UUIDString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "substringToIndex:", 8);
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "stringWithFormat:", CFSTR("%@-%03lu-%03u-%@-%@-%@"), v76, a5, v79, v35, v39, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v84, "URLByAppendingPathComponent:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLByAppendingPathExtension:", CFSTR("json"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v83;
      v86 = v82;
      LOBYTE(v42) = +[HMIFaceUtilities serializeJSONObject:url:error:](HMIFaceUtilities, "serializeJSONObject:url:error:", v83, v45, &v86);
      v47 = v86;

      if ((v42 & 1) == 0)
        break;
      v16 = v47;
      objc_msgSend(v85, "faceCrop");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "dataRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "URLByAppendingPathExtension:", CFSTR("jpg"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "writeToURL:atomically:", v50, 0);

      if ((v51 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error saving face crop image to disk for face classification:%@"), v85);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1000, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      v52 = (void *)MEMORY[0x220735570]();
      HMFGetOSLogHandle();
      v53 = objc_claimAutoreleasedReturnValue();
      v12 = v67;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v54;
        v94 = 2112;
        v95 = v85;
        _os_log_impl(&dword_219D45000, v53, OS_LOG_TYPE_INFO, "%{public}@Saved face classification:%@ to disk", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v52);

      v17 = v78 + 1;
      v18 = v16;
      v13 = v84;
      if (v68 == v78 + 1)
      {
        v55 = 1;
        v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
        if (v68)
          goto LABEL_4;
        goto LABEL_37;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error saving metadata to disk for face classification:%@"), v85);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v47;
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1000, v60, v47);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
    v62 = v61;
    v12 = v67;
    if (v64)
    {
      v62 = objc_retainAutorelease(v61);
      *v64 = v62;
    }
    HMIErrorLogC(v62);

    v13 = v84;
    goto LABEL_36;
  }
  v56 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v13, "path");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "stringWithFormat:", CFSTR("Error creating directory:%@ to save face classifications"), v57);
  v58 = objc_claimAutoreleasedReturnValue();

  obj = (id)v58;
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:underlyingError:", 1000, v58, v16);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v59;
  if (a8)
    *a8 = objc_retainAutorelease(v59);
  HMIErrorLogC(v46);
LABEL_36:

  v55 = 0;
LABEL_37:

  return v55;
}

+ (BOOL)serializeJSONObject:(id)a3 url:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v15;
  id v16;

  v7 = a4;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a3, 3, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v9;
  if (v8)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    v15 = v10;
    v12 = objc_msgSend(v11, "writeToURL:atomically:encoding:error:", v7, 1, 4, &v15);
    v13 = v15;

    if ((v12 & 1) == 0)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v13);
      HMIErrorLogC(v13);
    }

    v10 = v13;
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v9);
    HMIErrorLogC(v10);
    v12 = 0;
  }

  return v12;
}

+ (CGRect)faceBoundingBoxFromPhotosFaceCropData:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v33;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "absoluteFaceBoxFromPhotosFaceCropImageData:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend((id)objc_opt_class(), "faceCropDimensionsFromFaceCrop:error:", v3, 0);
  v13 = v12;
  v15 = v14;

  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  if (CGRectIsNull(v26))
    return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF070];
  if (v13 == *MEMORY[0x24BDBF148] && v15 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x24BDBF070];
  }
  else
  {
    v33.origin.x = HMICGRectMakeWithSize();
    v33.origin.y = v17;
    v33.size.width = v18;
    v33.size.height = v19;
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    v28 = CGRectIntersection(v27, v33);
    HMICGRectNormalizedFromPixel((unint64_t)v13, (unint64_t)v15, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    v24 = CGRectGetWidth(v29) * 0.150000006 * 0.5;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    v25 = CGRectGetHeight(v30) * 0.150000006 * 0.5;
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    return CGRectInset(v31, v24, v25);
  }
}

+ (BOOL)isValidFaceCrop:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  BOOL v13;

  v5 = a3;
  v6 = (void *)MEMORY[0x220735570]();
  v7 = (void *)objc_msgSend(a1, "newDictionaryPopulatedWithFaceCropDataFromImageData:", v5);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PVFC_VER"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToNumber:", &unk_24DC146F0);
    if ((v10 & 1) != 0
      || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_VER")),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqualToNumber:", &unk_24DC14708)))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_FB"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PVFC_CB"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 != 0;

      }
      else
      {
        v13 = 0;
      }

      if ((v10 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      v13 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v6);
  return v13;
}

+ (CGRect)absoluteFaceBoxFromPhotosFaceCropImageData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  CGRect *p_rect;
  __int128 v9;
  CGFloat x;
  CGFloat height;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  CGRect rect;
  uint64_t v26;
  CGRect result;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "newDictionaryPopulatedWithFaceCropDataFromImageData:", v3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PVFC_FB"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      memset(&rect, 0, sizeof(rect));
      if (CGRectMakeWithDictionaryRepresentation(v6, &rect))
      {
        p_rect = &rect;
        v9 = *(_OWORD *)&rect.origin.y;
      }
      else
      {
        v15 = (void *)MEMORY[0x220735570]();
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v24 = v17;
          _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't convert face box dict to rect", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        p_rect = (CGRect *)MEMORY[0x24BDBF070];
        v9 = *(_OWORD *)(MEMORY[0x24BDBF070] + 8);
      }
      v22 = v9;
      height = p_rect->size.height;
      x = p_rect->origin.x;
    }
    else
    {
      v12 = (void *)MEMORY[0x220735570]();
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(rect.origin.x) = 138543362;
        *(_QWORD *)((char *)&rect.origin.x + 4) = v14;
        _os_log_impl(&dword_219D45000, v13, OS_LOG_TYPE_ERROR, "%{public}@Face Box dict is null in photos metadata", (uint8_t *)&rect, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      x = *MEMORY[0x24BDBF070];
      v22 = *(_OWORD *)(MEMORY[0x24BDBF070] + 8);
      height = *(double *)(MEMORY[0x24BDBF070] + 24);
    }

  }
  else
  {
    x = *MEMORY[0x24BDBF070];
    v22 = *(_OWORD *)(MEMORY[0x24BDBF070] + 8);
    height = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v19 = *((double *)&v22 + 1);
  v18 = *(double *)&v22;
  v20 = x;
  v21 = height;
  result.size.height = v21;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v20;
  return result;
}

+ (CGSize)faceCropDimensionsFromFaceCrop:(id)a3 error:(id *)a4
{
  const __CFData *v5;
  void *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  const __CFString *v13;
  id v14;
  id v15;
  size_t v16;
  int v17;
  size_t v18[4];
  CGSize result;

  v18[3] = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFData *)a3;
  v6 = (void *)MEMORY[0x220735570]();
  if ((objc_msgSend(a1, "isValidFaceCrop:", v5) & 1) == 0)
  {
    v13 = CFSTR("the supplied data is not a facecrop");
    goto LABEL_7;
  }
  v7 = CGImageSourceCreateWithData(v5, (CFDictionaryRef)objc_msgSend(a1, "imageCreationOptions"));
  v8 = v7;
  if (!v7)
  {
    v13 = CFSTR("could not create an image source");
LABEL_7:
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v17 = -1;
  v18[0] = 0;
  v16 = 0;
  if ((getImagePropertiesFromCGImageSource(v7, &v17, v18, &v16) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Could not retrieve image properties"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v9 = (double)v18[0];
  v10 = (double)v16;
  CFRelease(v8);
  objc_autoreleasePoolPop(v6);

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (id)imageCreationOptions
{
  if (imageCreationOptions_onceToken != -1)
    dispatch_once(&imageCreationOptions_onceToken, &__block_literal_global_101);
  return (id)imageCreationOptions_kImageCreationOptions;
}

void __40__HMIFaceUtilities_imageCreationOptions__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD9818];
  v4[0] = *MEMORY[0x24BDD97D0];
  v4[1] = v0;
  v5[0] = MEMORY[0x24BDBD1C0];
  v5[1] = MEMORY[0x24BDBD1C8];
  v1 = *MEMORY[0x24BDD97F0];
  v4[2] = *MEMORY[0x24BDD9820];
  v4[3] = v1;
  v5[2] = MEMORY[0x24BDBD1C0];
  v5[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imageCreationOptions_kImageCreationOptions;
  imageCreationOptions_kImageCreationOptions = v2;

}

+ (id)newDictionaryPopulatedWithFaceCropDataFromImageData:(id)a3
{
  const __CFData *v3;
  void *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  const CGImageMetadata *v7;
  const CGImageMetadata *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  CGImageSource *v20;
  id v22;
  id v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFData *)a3;
  v4 = (void *)MEMORY[0x220735570]();
  if (v3)
  {
    v5 = CGImageSourceCreateWithData(v3, 0);
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Could not create image source"), 0);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v22);
    }
    v7 = CGImageSourceCopyMetadataAtIndex(v5, 0, 0);
    v8 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("No meta data exists on image"), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
    v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(v7, 0, CFSTR("PVFC:PVFC"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)MEMORY[0x24BDD1608];
      -[__CFString dataUsingEncoding:](v9, "dataUsingEncoding:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "JSONObjectWithData:options:error:", v12, 1, 0);
      v13 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x220735570]();
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v19;
        _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_ERROR, "%{public}@Metadata string is nil in photos face crop data", (uint8_t *)&v24, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v13 = 0;
    }

    v20 = v6;
    CFRelease(v8);
    v16 = (void *)v13;
    if (v20)
      CFRelease(v20);
  }
  else
  {
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v15;
      _os_log_impl(&dword_219D45000, v14, OS_LOG_TYPE_ERROR, "%{public}@imageData is nil", (uint8_t *)&v24, 0xCu);

    }
    v16 = 0;
  }
  objc_autoreleasePoolPop(v4);

  return v16;
}

@end
