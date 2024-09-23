@implementation HWEncoding

+ (id)encodeHandwriting:(id)a3 compress:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "drawing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "protoDrawingFromDrawing:compress:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "protoMessageFromHandwriting:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDrawing:", v10);

  objc_msgSend(v9, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)decodeHandwritingFromData:(id)a3
{
  id v3;
  HWPMessage *v4;
  HWPDrawing *v5;
  void *v6;
  HWPDrawing *v7;
  unsigned int v8;
  compression_algorithm v9;
  HWHandwritingItem *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  DKDrawing *v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  size_t v37;
  size_t v38;
  id v39;
  const uint8_t *v40;
  uint8_t *v41;
  uint8_t *v42;
  size_t v43;

  v3 = a3;
  if (v3)
  {
    v4 = -[HWPMessage initWithData:]([HWPMessage alloc], "initWithData:", v3);
    if (!v4)
    {
      NSLog(CFSTR("Unable to unarchive message from data."));
LABEL_30:
      v10 = 0;
      goto LABEL_31;
    }
    v5 = [HWPDrawing alloc];
    -[HWPMessage drawing](v4, "drawing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HWPDrawing initWithData:](v5, "initWithData:", v6);

    if (v7)
    {
      if (-[HWPDrawing compressionAlgorithm](v7, "compressionAlgorithm") < 2)
      {
        -[HWPDrawing strokes](v7, "strokes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
LABEL_28:
          NSLog(CFSTR("No archivedStrokesData found"));
          goto LABEL_29;
        }
      }
      else
      {
        v8 = -[HWPDrawing compressionAlgorithm](v7, "compressionAlgorithm") - 2;
        if (v8 > 4)
          v9 = -1;
        else
          v9 = dword_21DCC06E8[v8];
        v34 = -[HWPDrawing compressionAlgorithm](v7, "compressionAlgorithm");
        if (v34 >= 7)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v34);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = off_24E1B0B58[(int)v34];
        }
        -[HWPDrawing strokes](v7, "strokes");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "length");

        v38 = -[HWPDrawing decompressedLength](v7, "decompressedLength");
        -[HWPDrawing strokes](v7, "strokes");
        v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v40 = (const uint8_t *)objc_msgSend(v39, "bytes");

        v41 = (uint8_t *)malloc_type_calloc(v38, 1uLL, 0x6EAD4234uLL);
        if (v41)
        {
          v42 = v41;
          v43 = compression_decode_buffer(v41, v38, v40, v37, 0, v9);
          if (v43)
          {
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v42, v43);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            NSLog(CFSTR("Decoding %zu bytes %@ compresed failed!"), v37, v35);
            v11 = 0;
          }
          free(v42);
        }
        else
        {
          v11 = 0;
        }

        if (!v11)
          goto LABEL_28;
      }
      -[HWPDrawing encodedCanvasSize](v7, "encodedCanvasSize");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = HW_CGSizeFromIntegralData(v12);
      v15 = v14;

      -[HWPDrawing encodedStrokesFrame](v7, "encodedStrokesFrame");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HW_CGRectFromIntegralData(v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v24 = -[HWPDrawing strokesCount](v7, "strokesCount");
      v25 = -[HWPDrawing strokeDataFieldCount](v7, "strokeDataFieldCount");
      if (v25 < 4)
      {
        NSLog(CFSTR("Invalid strokeDataFieldCount < 4"));
LABEL_29:

        goto LABEL_30;
      }
      v26 = v25;
      v27 = objc_alloc_init(DKDrawing);
      -[DKDrawing setStrokesFrame:](v27, "setStrokesFrame:", v17, v19, v21, v23);
      -[DKDrawing setCanvasBounds:](v27, "setCanvasBounds:", 0.0, 0.0, v13, v15);
      +[HWEncoding decodedBrushStrokesWithData:inCanvasBounds:inStrokesFrame:strokeDataFieldCount:count:](HWEncoding, "decodedBrushStrokesWithData:inCanvasBounds:inStrokesFrame:strokeDataFieldCount:count:", v11, v26, v24, 0.0, 0.0, v13, v15, v17, v19, v21, v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        NSLog(CFSTR("Failed to unarchive strokes"));

        goto LABEL_29;
      }
      -[DKDrawing setStrokes:](v27, "setStrokes:", v28);
      v29 = (double)-[HWPMessage creationDate](v4, "creationDate") / 1000.0;
      v10 = -[HWHandwritingItem initWithDrawing:]([HWHandwritingItem alloc], "initWithDrawing:", v27);
      v30 = objc_alloc(MEMORY[0x24BDD1880]);
      -[HWPMessage identifier](v4, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithUUIDString:", v31);
      -[HWHandwritingItem setUuid:](v10, "setUuid:", v32);

      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", v29);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HWHandwritingItem setCreationDate:](v10, "setCreationDate:", v33);

    }
    else
    {
      NSLog(CFSTR("Unable to unarchive drawing from message.drawing data."));
      v10 = 0;
    }

LABEL_31:
    goto LABEL_32;
  }
  v10 = 0;
LABEL_32:

  return v10;
}

+ (id)protoMessageFromHandwriting:(id)a3
{
  id v3;
  HWPMessage *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = a3;
    v4 = objc_alloc_init(HWPMessage);
    objc_msgSend(v3, "creationDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    -[HWPMessage setCreationDate:](v4, "setCreationDate:", (uint64_t)(v6 * 1000.0));

    objc_msgSend(v3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HWPMessage setIdentifier:](v4, "setIdentifier:", v8);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)encodeBrushStrokesAsData:(id)a3 inCanvasBounds:(CGRect)a4 inStrokesFrame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  double v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  _BYTE v57[128];
  uint64_t v58;
  CGRect v59;
  CGRect v60;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.origin.y;
  v10 = a4.origin.x;
  v58 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  objc_msgSend(v11, "strokes");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v48, "count");
  v13 = objc_msgSend(v11, "totalPoints");
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * v13 + 2 * v12);
  v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v47 = objc_msgSend(v46, "mutableBytes");
  memset(&v56, 0, sizeof(v56));
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v55.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v55.c = v14;
  *(_OWORD *)&v55.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformTranslate(&v56, &v55, v10 - x, v9 - y);
  if (v12)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      v50 = v16;
      objc_msgSend(v48, "objectAtIndex:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "strokePoints");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      *(_WORD *)(v47 + 2 * v15++) = v19;
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v49 = v17;
      objc_msgSend(v17, "strokePoints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v52;
        do
        {
          v24 = 0;
          v25 = v47 + 4 + 2 * v15;
          v15 += 4 * v22;
          do
          {
            if (*(_QWORD *)v52 != v23)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
            objc_msgSend(v26, "location");
            objc_msgSend(v26, "setLocation:", vaddq_f64(*(float64x2_t *)&v56.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v56.c, v27), *(float64x2_t *)&v56.a, v28)));
            if (v26)
            {
              v29 = v26;
              objc_msgSend(v29, "location");
              v31 = v30;
              v33 = v32;
              v59.origin.x = 0.0;
              v59.origin.y = 0.0;
              v59.size.width = width;
              v59.size.height = height;
              v34 = v31 / CGRectGetWidth(v59);
              v60.origin.x = 0.0;
              v60.origin.y = 0.0;
              v60.size.width = width;
              v60.size.height = height;
              *(float *)&v33 = v33 / CGRectGetHeight(v60);
              objc_msgSend(v29, "force");
              *(float *)&v35 = v35;
              v36 = *(float *)&v35 / *(float *)&MaxForceValue;
              objc_msgSend(v29, "velocity");
              v38 = v37;

              v39 = v38;
              LODWORD(v40) = llroundf((float)(v34 + 1.0) * 32767.0);
              LODWORD(v41) = llroundf((float)(*(float *)&v33 + 1.0) * 32767.0);
              LODWORD(v42) = llroundf((float)((float)(v39 / *(float *)&MaxVelocityValue) + 1.0) * 32767.0);
              LODWORD(v43) = llroundf((float)(v36 + 1.0) * 32767.0);
              v44 = (v43 << 48) | (v42 << 32) | (v41 << 16) | v40;
            }
            else
            {
              v44 = 0;
            }
            *(_QWORD *)(v25 - 4) = v44;
            ++v24;
            v25 += 8;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        }
        while (v22);
      }

      v16 = v50 + 1;
    }
    while (v50 + 1 != v12);
  }

  return v46;
}

+ (id)decodedBrushStrokesWithData:(id)a3 inCanvasBounds:(CGRect)a4 inStrokesFrame:(CGRect)a5 strokeDataFieldCount:(unsigned int)a6 count:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned __int16 v29;
  unsigned __int16 v30;
  unsigned __int16 v31;
  DKDrawingStrokePoint *v32;
  CGFloat v33;
  CGFloat v34;
  float v35;
  float v36;
  double v37;
  double v38;
  void *v39;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  DKDrawingStroke *v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGRect v53;
  CGRect v54;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v15 = a3;
  v16 = v15;
  if (a6 > 3)
  {
    v18 = objc_msgSend(v15, "length");
    v17 = 0;
    if (a7 && v18)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a7);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v52, 0, sizeof(v52));
      v19 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *(_OWORD *)&v51.a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v51.c = v19;
      *(_OWORD *)&v51.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      CGAffineTransformTranslate(&v52, &v51, -(v14 - x), -(v13 - y));
      v41 = v16;
      v20 = objc_retainAutorelease(v16);
      v43 = objc_msgSend(v20, "bytes");
      v21 = objc_msgSend(v20, "length");
      if (v21 >= 2)
      {
        v22 = 0;
        v23 = 0;
        v49 = v21 >> 1;
        v24 = a6;
        v46 = 2 * a6;
        v47 = a6 - 1;
        v42 = a7;
        do
        {
          v45 = v22;
          v50 = objc_alloc_init(DKDrawingStroke);
          v48 = *(unsigned __int16 *)(v43 + 2 * v23);
          if (*(_WORD *)(v43 + 2 * v23))
          {
            v25 = 0;
            v26 = v43 + 2 + 2 * v23++;
            do
            {
              if (v47 + v23 >= v49)
                break;
              v27 = 0;
              v28 = 0;
              v29 = 0;
              v30 = 0;
              v31 = 0;
              do
              {
                switch(v27)
                {
                  case 0:
                    v31 = *(_WORD *)(v26 + 2 * v27);
                    break;
                  case 1:
                    v30 = *(_WORD *)(v26 + 2 * v27);
                    break;
                  case 2:
                    v29 = *(_WORD *)(v26 + 2 * v27);
                    break;
                  case 3:
                    v28 = *(_WORD *)(v26 + 2 * v27);
                    break;
                  default:
                    break;
                }
                ++v27;
              }
              while (v24 != v27);
              v23 += v24;
              v32 = objc_alloc_init(DKDrawingStrokePoint);
              v53.origin.x = 0.0;
              v53.origin.y = 0.0;
              v53.size.width = width;
              v53.size.height = height;
              v33 = CGRectGetWidth(v53) * (float)((float)((float)v31 / 32767.0) + -1.0);
              v54.origin.x = 0.0;
              v54.origin.y = 0.0;
              v54.size.width = width;
              v54.size.height = height;
              v34 = CGRectGetHeight(v54);
              v35 = (float)((float)((float)v29 / 32767.0) + -1.0) * *(float *)&MaxVelocityValue;
              v36 = (float)((float)((float)v28 / 32767.0) + -1.0) * *(float *)&MaxForceValue;
              -[DKDrawingStrokePoint setLocation:](v32, "setLocation:", v33, v34 * (float)((float)((float)v30 / 32767.0) + -1.0));
              -[DKDrawingStrokePoint setForce:](v32, "setForce:", v36);
              -[DKDrawingStrokePoint setVelocity:](v32, "setVelocity:", v35);
              -[DKDrawingStrokePoint location](v32, "location");
              -[DKDrawingStrokePoint setLocation:](v32, "setLocation:", vaddq_f64(*(float64x2_t *)&v52.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v52.c, v37), *(float64x2_t *)&v52.a, v38)));
              -[DKDrawingStroke strokePoints](v50, "strokePoints");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "addObject:", v32);

              ++v25;
              v26 += v46;
            }
            while (v25 != v48);
          }
          else
          {
            ++v23;
          }
          objc_msgSend(v44, "addObject:", v50);

          v22 = v45 + 1;
        }
        while (v45 + 1 < v42 && v23 < v49);
      }
      v16 = v41;
      v17 = v44;
    }
  }
  else
  {
    NSLog(CFSTR("Unexpeced strokeDataFieldCount < 4"));
    v17 = 0;
  }

  return v17;
}

+ (void)writeDataToDisk:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v5 = a4;
  v6 = a3;
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v9 = v5;
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("handwriting_%@.data"), v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  objc_msgSend(v6, "writeToURL:options:error:", v13, 1, &v16);

  v14 = v16;
  v15 = v14;
  if (v14)
    NSLog(CFSTR("%@"), v14);
  else
    NSLog(CFSTR("Wrote payload to %@"), v13);

}

+ (id)protoDrawingFromDrawing:(id)a3 compress:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  HWPDrawing *v6;
  double v7;
  double v8;
  void *v9;
  float64x2_t v10;
  float64_t v11;
  float64x2_t v12;
  float64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  size_t v29;
  uint8_t *v30;
  uint8_t *v31;
  size_t v32;
  uint64_t v33;
  void *v34;

  if (a3)
  {
    v4 = a4;
    v5 = (void *)objc_msgSend(a3, "copy");
    v6 = objc_alloc_init(HWPDrawing);
    objc_msgSend(v5, "canvasBounds");
    HW_DataFromIntegralCGSize(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "strokesFrame");
    HW_DataFromIntegralCGRect(v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "canvasBounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v5, "strokesFrame");
    +[HWEncoding encodeBrushStrokesAsData:inCanvasBounds:inStrokesFrame:](HWEncoding, "encodeBrushStrokesAsData:inCanvasBounds:inStrokesFrame:", v5, v16, v18, v20, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v4)
    {
      v29 = objc_msgSend(v27, "length");
      v30 = (uint8_t *)malloc_type_calloc(v29, 1uLL, 0x100004077774924uLL);
      if (v30)
      {
        v31 = v30;
        v28 = objc_retainAutorelease(v28);
        v32 = compression_encode_buffer(v31, v29, (const uint8_t *)objc_msgSend(v28, "bytes"), v29, 0, COMPRESSION_LZMA);
        if (v32)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v31, v32);
          v33 = objc_claimAutoreleasedReturnValue();

          -[HWPDrawing setCompressionAlgorithm:](v6, "setCompressionAlgorithm:", 4);
          -[HWPDrawing setDecompressedLength:](v6, "setDecompressedLength:", v29);
          v28 = (id)v33;
        }
        else
        {
          -[HWPDrawing setCompressionAlgorithm:](v6, "setCompressionAlgorithm:", 1);
        }
        free(v31);
      }
    }
    -[HWPDrawing setEncodedCanvasSize:](v6, "setEncodedCanvasSize:", v9);
    -[HWPDrawing setEncodedStrokesFrame:](v6, "setEncodedStrokesFrame:", v14);
    -[HWPDrawing setStrokes:](v6, "setStrokes:", v28);
    objc_msgSend(v5, "strokes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HWPDrawing setStrokesCount:](v6, "setStrokesCount:", objc_msgSend(v34, "count"));

    -[HWPDrawing setStrokeDataFieldCount:](v6, "setStrokeDataFieldCount:", 4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
