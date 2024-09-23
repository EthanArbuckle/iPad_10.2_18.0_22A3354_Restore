@implementation HMIVideoAnnotationParser

- (HMIVideoAnnotationParser)initWithArray:(id)a3
{
  id v4;
  HMIVideoAnnotationParser *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSArray *tracks;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMIVideoAnnotationParser;
  v5 = -[HMIVideoAnnotationParser init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__HMIVideoAnnotationParser_initWithArray___block_invoke;
    v11[3] = &unk_24DBEA8C8;
    v12 = v6;
    v7 = v6;
    objc_msgSend(v4, "na_map:", v11);
    v8 = objc_claimAutoreleasedReturnValue();
    tracks = v5->_tracks;
    v5->_tracks = (NSArray *)v8;

  }
  return v5;
}

objc_class *__42__HMIVideoAnnotationParser_initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  HMIVideoAnnotationParserTrack *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  id v22;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("class"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("box"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HMIVideoAnalyzerEvent eventClassForShortName:](HMIVideoAnalyzerEvent, "eventClassForShortName:", v4);
  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v8);

      }
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __42__HMIVideoAnnotationParser_initWithArray___block_invoke_2;
    v20 = &unk_24DBEA8A0;
    v21 = v5;
    v22 = v13;
    v14 = v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v17);
    v15 = [HMIVideoAnnotationParserTrack alloc];
    v7 = -[HMIVideoAnnotationParserTrack initWithEventClass:records:UUID:](v15, "initWithEventClass:records:UUID:", v7, v14, v12, v17, v18, v19, v20);

  }
  return v7;
}

void __42__HMIVideoAnnotationParser_initWithArray___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  float v12;
  double v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  double v18;
  float v19;
  void *v20;
  float v21;
  float v22;
  double v23;
  float v24;
  void *v25;
  float v26;
  float v27;
  double v28;
  float v29;
  void *v30;
  HMIVideoAnnotationParserRecord *v31;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v13 = v12;
  if (v12 > 1.0)
    v13 = 1.0;
  v14 = fmax(v13, 0.0);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  v18 = v17;
  if (v17 > 1.0)
    v18 = 1.0;
  v19 = fmax(v18, 0.0);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;

  v23 = v22;
  if (v22 > 1.0)
    v23 = 1.0;
  v24 = fmax(v23, 0.0);
  objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "floatValue");
  v27 = v26;

  v28 = v27;
  if (v27 > 1.0)
    v28 = 1.0;
  v29 = fmax(v28, 0.0);
  v30 = *(void **)(a1 + 40);
  v31 = -[HMIVideoAnnotationParserRecord initWithBoundingBox:timeStamp:]([HMIVideoAnnotationParserRecord alloc], "initWithBoundingBox:timeStamp:", v19, v14, (float)(v29 - v19), (float)(v24 - v14), v9);
  objc_msgSend(v30, "addObject:", v31);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastKnownTimeStamp
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[HMIVideoAnnotationParser tracks](self, "tracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__HMIVideoAnnotationParser_lastKnownTimeStamp__block_invoke;
  v6[3] = &unk_24DBEA8F0;
  v6[4] = &v7;
  objc_msgSend(v4, "na_each:", v6);

  CMTimeMakeWithSeconds((CMTime *)retstr, fmax(v8[3] + -0.05, 0.0), 1000);
  _Block_object_dispose(&v7, 8);
  return result;
}

void __46__HMIVideoAnnotationParser_lastKnownTimeStamp__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(a2, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeStamp");
  v7 = v6;

  if (v3 >= v7)
    v8 = v3;
  else
    v8 = v7;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
}

- (id)eventsForTimeStamp:(id *)a3
{
  Float64 Seconds;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  Float64 v11;
  uint64_t v12;
  CMTime time;

  time = *(CMTime *)a3;
  Seconds = CMTimeGetSeconds(&time);
  -[HMIVideoAnnotationParser tracks](self, "tracks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__HMIVideoAnnotationParser_eventsForTimeStamp___block_invoke_2;
  v9[3] = &unk_24DBEA958;
  v11 = Seconds;
  v12 = 0x3F9999DCB5781C72;
  v10 = &__block_literal_global_9;
  objc_msgSend(v5, "na_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

CGFloat __47__HMIVideoAnnotationParser_eventsForTimeStamp___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, float a9, float a10)
{
  double MinX;
  CGFloat v24;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v31.origin.x = a5;
  v31.origin.y = a6;
  v31.size.width = a7;
  v31.size.height = a8;
  v24 = (CGRectGetMinX(v31) * a9 + a10 * MinX) / (float)(a9 + a10);
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  CGRectGetMinY(v32);
  v33.origin.x = a5;
  v33.size.height = a8;
  v33.origin.y = a6;
  v33.size.width = a7;
  CGRectGetMinY(v33);
  v34.origin.x = a1;
  v34.origin.y = a2;
  v34.size.width = a3;
  v34.size.height = a4;
  CGRectGetWidth(v34);
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.width = a7;
  v35.size.height = a8;
  CGRectGetWidth(v35);
  v36.origin.x = a1;
  v36.size.width = a3;
  v36.origin.y = a2;
  v36.size.height = a4;
  CGRectGetHeight(v36);
  v37.origin.x = a5;
  v37.origin.y = a6;
  v37.size.width = a7;
  v37.size.height = a8;
  CGRectGetHeight(v37);
  return v24;
}

id __47__HMIVideoAnnotationParser_eventsForTimeStamp___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  unint64_t v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  unint64_t v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  void *v72;
  void *v73;
  double v75;
  void *v76;

  v3 = a2;
  objc_msgSend(v3, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = 0;
    while (1)
    {
      v7 = *(double *)(a1 + 40) + *(double *)(a1 + 48);
      objc_msgSend(v3, "records");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeStamp");
      v11 = v10;

      if (v7 < v11)
        goto LABEL_10;
      v12 = *(double *)(a1 + 40) - *(double *)(a1 + 48);
      objc_msgSend(v3, "records");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeStamp");
      v16 = v15;

      if (v12 < v16)
        break;
      v17 = v6 + 1;
      objc_msgSend(v3, "records");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 + 1 >= objc_msgSend(v18, "count"))
      {

      }
      else
      {
        v19 = *(double *)(a1 + 40) + *(double *)(a1 + 48);
        objc_msgSend(v3, "records");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", v6 + 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeStamp");
        v23 = v22;

        if (v19 < v23)
        {
          v37 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v3, "records");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "objectAtIndexedSubscript:", v6);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "boundingBox");
          v75 = v39;
          v41 = v40;
          v43 = v42;
          v45 = v44;
          objc_msgSend(v3, "records");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v6 + 1;
          objc_msgSend(v46, "objectAtIndexedSubscript:", v6 + 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "boundingBox");
          v50 = v49;
          v52 = v51;
          v54 = v53;
          v56 = v55;
          v57 = *(double *)(a1 + 40);
          objc_msgSend(v3, "records");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", v6);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "timeStamp");
          *(float *)&v57 = v57 - v60;
          objc_msgSend(v3, "records");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectAtIndexedSubscript:", v47);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "timeStamp");
          *(float *)&v63 = v63 - *(double *)(a1 + 40);
          v64 = (*(double (**)(uint64_t, double, double, double, double, double, double, double, double, double))(v37 + 16))(v37, v75, v41, v43, v45, v50, v52, v54, v56, COERCE_DOUBLE(__PAIR64__(LODWORD(v63), LODWORD(v57))));
          v66 = v65;
          v68 = v67;
          v70 = v69;

          v71 = objc_msgSend(v3, "eventClass");
          objc_msgSend(v3, "UUID");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMIVideoAnnotationParser eventForClass:boundingBox:UUID:](HMIVideoAnnotationParser, "eventForClass:boundingBox:UUID:", v71, v72, v64, v66, v68, v70);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

          goto LABEL_13;
        }
      }
      objc_msgSend(v3, "records");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

      v6 = v17;
      if (v17 >= v25)
        goto LABEL_10;
    }
    v26 = objc_msgSend(v3, "eventClass");
    objc_msgSend(v3, "records");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectAtIndexedSubscript:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "boundingBox");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v3, "UUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMIVideoAnnotationParser eventForClass:boundingBox:UUID:](HMIVideoAnnotationParser, "eventForClass:boundingBox:UUID:", v26, v36, v29, v31, v33, v35);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_10:
  v73 = 0;
LABEL_13:

  return v73;
}

- (id)eventsForFragment
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIVideoAnnotationParser tracks](self, "tracks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HMIVideoAnnotationParser_eventsForFragment__block_invoke;
  v8[3] = &unk_24DBEA980;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_each:", v8);

  objc_msgSend(v5, "na_map:", &__block_literal_global_59);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __45__HMIVideoAnnotationParser_eventsForFragment__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  id v32;

  v32 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v32, "eventClass")) & 1) == 0)
  {
    v3 = objc_msgSend(v32, "eventClass");
    if (v3 == objc_opt_class())
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(v32, "eventClass", v4));
      goto LABEL_11;
    }
    objc_msgSend(v32, "records");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      while (1)
      {
        v8 = v7++;
        objc_msgSend(v32, "records");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        v11 = v7;
        if (v7 < v10)
          break;
LABEL_8:
        objc_msgSend(v32, "records");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v7 >= v31)
          goto LABEL_11;
      }
      while (1)
      {
        objc_msgSend(v32, "records");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "boundingBox");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v32, "records");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectAtIndexedSubscript:", v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "boundingBox");
        LODWORD(v15) = HMICGRectMaxParallelEdgeDistanceRatio(v15, v17, v19, v21, v24, v25, v26, v27);

        v4 = *(float *)&v15;
        if (*(float *)&v15 > 0.05)
          goto LABEL_10;
        ++v11;
        objc_msgSend(v32, "records", v4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (v11 >= v29)
          goto LABEL_8;
      }
    }
  }
LABEL_11:

}

id __45__HMIVideoAnnotationParser_eventsForFragment__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMIVideoAnnotationParser eventForClass:boundingBox:UUID:](HMIVideoAnnotationParser, "eventForClass:boundingBox:UUID:", a2, v3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)eventForClass:(Class)a3 boundingBox:(CGRect)a4 UUID:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  HMIConfidence *v11;
  HMIVideoAnalyzerEventPerson *v12;
  HMIFaceCrop *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  HMIFaceCrop *v21;
  HMIFaceprint *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMIFaceprint *v27;
  HMIFaceClassification *v28;
  void *v29;
  HMIFaceClassification *v30;
  HMIFaceRecognition *v31;
  void *v32;
  HMIFaceRecognition *v33;
  HMIVideoAnalyzerEventFace *v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a5;
  v11 = -[HMIConfidence initWithValue:levelThresholds:]([HMIConfidence alloc], "initWithValue:levelThresholds:", &unk_24DC15110, 1.0);
  if ((Class)objc_opt_class() == a3)
  {
    v13 = [HMIFaceCrop alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDBF090];
    v18 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v19 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v20 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v21 = -[HMIFaceCrop initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:](v13, "initWithUUID:dataRepresentation:dateCreated:faceBoundingBox:", v14, v15, v16, *MEMORY[0x24BDBF090], v18, v19, v20);

    v22 = [HMIFaceprint alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HMIFaceprint initWithUUID:data:modelUUID:faceCropUUID:](v22, "initWithUUID:data:modelUUID:faceCropUUID:", v23, v24, v25, v26);

    v28 = [HMIFaceClassification alloc];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HMIFaceClassification initWithPersonUUID:sourceUUID:sessionEntityUUID:confidence:familiarity:](v28, "initWithPersonUUID:sourceUUID:sessionEntityUUID:confidence:familiarity:", 0, v29, v10, 2, 1.0);

    v31 = [HMIFaceRecognition alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[HMIFaceRecognition initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:](v31, "initWithFaceCrop:faceprint:classifications:predictedLinkedEntityUUIDs:faceQualityScore:sessionEntityAssignment:sessionEntityUUID:", v21, v27, v32, 0, 1, v10, -1.0);

    v34 = -[HMIVideoAnalyzerEventFace initWithConfidence:boundingBox:faceRecognition:]([HMIVideoAnalyzerEventFace alloc], "initWithConfidence:boundingBox:faceRecognition:", v11, v33, v17, v18, v19, v20);
    v12 = -[HMIVideoAnalyzerEventPerson initWithConfidence:boundingBox:face:]([HMIVideoAnalyzerEventPerson alloc], "initWithConfidence:boundingBox:face:", v11, v34, x, y, width, height);

  }
  else
  {
    v12 = (HMIVideoAnalyzerEventPerson *)objc_msgSend([a3 alloc], "initWithConfidence:boundingBox:", v11, x, y, width, height);
  }

  return v12;
}

- (NSArray)tracks
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracks, 0);
}

@end
