@implementation SKTileMapNode(GameplayKit)

+ (id)tileMapNodesWithTileSet:()GameplayKit columns:rows:tileSize:fromNoiseMap:tileTypeNoiseMapThresholds:
{
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  char *v18;
  void **v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  float v30;
  float v31;
  __int128 v32;
  float v33;
  float v34;
  __int128 v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  unint64_t v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  unint64_t v54;
  unint64_t v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  double v62;
  double v63;
  _QWORD *v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v69;
  double v70;
  double v71;
  float v72;
  float v73;
  unint64_t v74;
  unint64_t v75;
  id v76;
  unint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  float v81;
  float v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  uint64_t v88;
  uint64_t v89;

  v75 = a7;
  v77 = a6;
  v89 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a8;
  v87 = a9;
  v76 = v14;
  v88 = objc_msgSend(v87, "count");
  objc_msgSend(v14, "sampleCount");
  v86 = v15;
  objc_msgSend(v14, "sampleCount");
  v85 = v16;
  v17 = v88 + 1;
  v18 = (char *)&v69 - ((8 * (v88 + 1) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v18, 8 * (v88 + 1));
  if (v17)
  {
    v19 = (void **)((char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    v20 = v17;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *v19;
      *v19++ = (void *)v21;

      --v20;
    }
    while (v20);
  }
  v69 = (uint64_t)&v69;
  v70 = a1;
  v71 = a2;
  objc_msgSend(MEMORY[0x24BDE9ED8], "emptyTileGroup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v75 || !v77)
    goto LABEL_30;
  v24 = 0;
  v26 = v85;
  v25 = v86;
  v82 = (float)(int)v86;
  v73 = (float)SDWORD1(v85);
  if (v17 <= 1)
    v27 = 1;
  else
    v27 = v17;
  *(_QWORD *)&v86 = v27 - 1;
  v72 = 1.0 / (float)v75;
  v81 = 1.0 / (float)v77;
  while (2)
  {
    v28 = 0;
    v74 = v24;
    *(float *)&v26 = (float)((float)((float)v24 + 0.16667) * v73) * v72;
    v85 = v26;
    *(float *)&v26 = (float)((float)((float)v24 + 0.5) * v73) * v72;
    v84 = v26;
    *(float *)&v25 = (float)((float)((float)v24 + 0.83333) * v73) * v72;
    v83 = v25;
    do
    {
      *(float *)&v25 = (float)((float)((float)v28 + 0.16667) * v82) * v81;
      v80 = v25;
      DWORD1(v25) = v85;
      v29 = v76;
      objc_msgSend(v76, "interpolatedValueAtPosition:", *(double *)&v25);
      v31 = v30;
      *(float *)&v32 = (float)((float)((float)v28 + 0.5) * v82) * v81;
      v79 = v32;
      DWORD1(v32) = v85;
      objc_msgSend(v29, "interpolatedValueAtPosition:", *(double *)&v32);
      v34 = v33;
      *(float *)&v35 = (float)((float)((float)v28 + 0.83333) * v82) * v81;
      v78 = v35;
      DWORD1(v35) = v85;
      objc_msgSend(v29, "interpolatedValueAtPosition:", *(double *)&v35);
      v37 = v36;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v84, v80)));
      v39 = v38;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v84, v79)));
      v41 = v40;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v84, v78)));
      v43 = v42;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v83, v80)));
      v45 = v44;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v83, v79)));
      v47 = v46;
      objc_msgSend(v29, "interpolatedValueAtPosition:", COERCE_DOUBLE(__PAIR64__(v83, v78)));
      if (!v88)
      {
        v49 = 0;
LABEL_22:
        v54 = 0;
        do
        {
          while (1)
          {
            v55 = v54 > v49 ? -1 : v54;
            objc_msgSend(v13, "tileGroups");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "count");

            v58 = *(void **)&v18[8 * v54];
            if (v55 < v57)
              break;
            objc_msgSend(*(id *)&v18[8 * v54++], "addObject:", v23);
            if (v17 == v54)
              goto LABEL_12;
          }
          objc_msgSend(v13, "tileGroups");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "objectAtIndexedSubscript:", v55);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObject:", v60);

          ++v54;
        }
        while (v17 != v54);
        goto LABEL_12;
      }
      v49 = 0;
      v50 = (float)((float)(v48 + v47)
                  + (float)((float)(v45 + (float)(v43 + v41)) + (float)((float)(v39 + v37) + (float)(v34 + v31))))
          * 0.11111;
      while (1)
      {
        objc_msgSend(v87, "objectAtIndexedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "floatValue");
        v53 = v52;

        if (v50 < v53)
          break;
        if ((_QWORD)v86 == v49)
          goto LABEL_12;
        if (v88 == ++v49)
        {
          v49 = v88;
          break;
        }
      }
      if (v17)
        goto LABEL_22;
LABEL_12:
      ++v28;
    }
    while (v28 != v77);
    v24 = v74 + 1;
    if (v74 + 1 != v75)
      continue;
    break;
  }
LABEL_30:
  v61 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62 = v71;
  v63 = v70;
  if (v17)
  {
    v64 = (uint64_t *)((char *)&v69 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0));
    v65 = v17;
    do
    {
      objc_msgSend(MEMORY[0x24BDE9EE0], "tileMapNodeWithTileSet:columns:rows:tileSize:tileGroupLayout:", v13, v77, v75, *v64, v63, v62);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObject:", v66);

      ++v64;
      --v65;
    }
    while (v65);

    v67 = 8 * v88;
    do
    {

      v67 -= 8;
    }
    while (v67 != -8);
  }
  else
  {

  }
  return v61;
}

@end
