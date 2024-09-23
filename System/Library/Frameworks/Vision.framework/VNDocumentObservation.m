@implementation VNDocumentObservation

- (VNDocumentObservation)initWithTopLevelRegion:(id)a3 requestRevision:(unint64_t)a4
{
  id v6;
  void *v7;
  VNDocumentObservation *v8;
  uint64_t v9;
  CRDocumentOutputRegion *topLevelRegion;
  void *v11;
  uint64_t v12;
  NSArray *blocks;
  void *v14;
  CRDocumentOutputRegion *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  objc_msgSend(v6, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "boundingBox");
  v18.receiver = self;
  v18.super_class = (Class)VNDocumentObservation;
  v8 = -[VNDetectedObjectObservation initWithRequestRevision:boundingBox:](&v18, sel_initWithRequestRevision_boundingBox_, a4);

  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    topLevelRegion = v8->_topLevelRegion;
    v8->_topLevelRegion = (CRDocumentOutputRegion *)v9;

    -[VNDocumentObservation _textBlockObservationsFromRegion:requestRevision:](v8, "_textBlockObservationsFromRegion:requestRevision:", v8->_topLevelRegion, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    blocks = v8->_blocks;
    v8->_blocks = (NSArray *)v12;

    -[CRDocumentOutputRegion trackingID](v8->_topLevelRegion, "trackingID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v8->_topLevelRegion;
    if (v14)
      -[CRDocumentOutputRegion trackingID](v15, "trackingID");
    else
      -[CRDocumentOutputRegion uuid](v15, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VNObservation setUUID:](v8, "setUUID:", v16);

  }
  return v8;
}

- (id)_textBlockObservationsFromRegion:(id)a3 requestRevision:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  VNRecognizedTextBlockObservation *v14;
  VNRecognizedTextBlockObservation *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "contentsWithTypes:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "type", (_QWORD)v19) == 2
          || objc_msgSend(v13, "type") == 4
          || objc_msgSend(v13, "type") == 8
          || objc_msgSend(v13, "type") == 2048)
        {
          v14 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", a4, v13);
          if (!v14)
          {

            v17 = 0;
            goto LABEL_16;
          }
          v15 = v14;
          objc_msgSend(v5, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNRecognizedTextObservation setIsTitle:](v15, "setIsTitle:", v13 == v16);

          objc_msgSend(v7, "addObject:", v15);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  v17 = v7;
LABEL_16:

  return v17;
}

- (NSString)getTranscript
{
  return (NSString *)-[CRDocumentOutputRegion text](self->_topLevelRegion, "text");
}

- (VNRecognizedTextBlockObservation)getTitle
{
  void *v3;
  VNRecognizedTextBlockObservation *v4;

  -[CRDocumentOutputRegion title](self->_topLevelRegion, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision"), v3);
  else
    v4 = 0;

  return v4;
}

- (id)blocksWithTypes:(unint64_t)a3 inRegion:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int16 v8;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  VNRecognizedTextBlockObservation *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[8];
  _QWORD v31[8];
  _BYTE v32[128];
  uint64_t v33;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  if ((v8 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](self->_blocks, "filteredArrayUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke;
    v31[3] = &__block_descriptor_64_e47_B24__0__VNBarcodeObservation_8__NSDictionary_16l;
    *(CGFloat *)&v31[4] = x;
    *(CGFloat *)&v31[5] = y;
    *(CGFloat *)&v31[6] = width;
    *(CGFloat *)&v31[7] = height;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayUsingPredicate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObjectsFromArray:", v15);
  }
  if ((v8 & 0x3E) != 0)
  {
    -[CRDocumentOutputRegion contentsWithTypes:](self->_topLevelRegion, "contentsWithTypes:", v8 & 0xFFF);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke_2;
    v30[3] = &__block_descriptor_64_e41_B24__0__CROutputRegion_8__NSDictionary_16l;
    *(CGFloat *)&v30[4] = x;
    *(CGFloat *)&v30[5] = y;
    *(CGFloat *)&v30[6] = width;
    *(CGFloat *)&v30[7] = height;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "filteredArrayUsingPredicate:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23));
          if (v24)
            objc_msgSend(v10, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v21);
    }

  }
  return v10;
}

- (id)boundingBoxForTextRange:(_NSRange)a3 error:(id *)a4
{
  void *v5;
  VNRectangleObservation *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  VNRectangleObservation *v22;

  -[CRDocumentOutputRegion quadForTextInCharacterRange:](self->_topLevelRegion, "quadForTextInCharacterRange:", a3.location, a3.length, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [VNRectangleObservation alloc];
  v7 = -[VNObservation requestRevision](self, "requestRevision");
  objc_msgSend(v5, "topLeft");
  v9 = v8;
  v11 = 1.0 - v10;
  objc_msgSend(v5, "topRight");
  v13 = v12;
  v15 = 1.0 - v14;
  objc_msgSend(v5, "bottomRight");
  v17 = v16;
  v19 = 1.0 - v18;
  objc_msgSend(v5, "bottomLeft");
  v22 = -[VNRectangleObservation initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:](v6, "initWithRequestRevision:topLeft:topRight:bottomRight:bottomLeft:", v7, v9, v11, v13, v15, v17, v19, v21, 1.0 - v20);

  return v22;
}

- (_NSRange)rangeOfTextBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  objc_msgSend(a3, "getCROutputRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRDocumentOutputRegion rangeOfContentRegion:](self->_topLevelRegion, "rangeOfContentRegion:", v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)rangeOfTextBlockObservation:(id)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  objc_msgSend(a3, "getCROutputRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRDocumentOutputRegion rangeOfContentRegion:](self->_topLevelRegion, "rangeOfContentRegion:", v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)textBlockOfTypes:(unint64_t)a3 containingTextAtIndex:(int64_t)a4
{
  void *v5;
  VNRecognizedTextBlock *v6;

  -[CRDocumentOutputRegion contentRegionOfType:containingTextAtIndex:](self->_topLevelRegion, "contentRegionOfType:containingTextAtIndex:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VNRecognizedTextBlock initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlock alloc], "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision"), v5);

  return v6;
}

- (NSArray)getBlocks
{
  return (NSArray *)-[VNDocumentObservation blocksWithTypes:inRegion:](self, "blocksWithTypes:inRegion:", 4159, 0.0, 0.0, 1.0, 1.0);
}

- (id)textBlockWithCharacterRange:(_NSRange)a3
{
  void *v4;
  VNRecognizedTextBlockObservation *v5;

  -[CRDocumentOutputRegion outputRegionWithContentsOfCharacterRange:](self->_topLevelRegion, "outputRegionWithContentsOfCharacterRange:", a3.location, a3.length);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision"), v4);
  else
    v5 = 0;

  return v5;
}

- (id)closestTextBlockOfTypes:(unint64_t)a3 toPoint:(CGPoint)a4 maximumPixelDistance:(int64_t)a5
{
  void *v6;
  VNRecognizedTextBlockObservation *v7;

  -[CRDocumentOutputRegion closestContentRegionOfType:toNormalizedPoint:maxPixelDistance:](self->_topLevelRegion, "closestContentRegionOfType:toNormalizedPoint:maxPixelDistance:", a3, a5, a4.x, 1.0 - a4.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[VNRecognizedTextBlockObservation initWithRequestRevision:crOutputRegion:]([VNRecognizedTextBlockObservation alloc], "initWithRequestRevision:crOutputRegion:", -[VNObservation requestRevision](self, "requestRevision"), v6);
  else
    v7 = 0;

  return v7;
}

- (id)getCRDocumentOutputRegion
{
  return self->_topLevelRegion;
}

- (BOOL)shouldReprocessDocument
{
  void *v2;
  char v3;

  -[VNDocumentObservation getCRDocumentOutputRegion](self, "getCRDocumentOutputRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldReprocessDocument");

  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNDocumentObservation;
  return -[NSArray hash](self->_blocks, "hash") ^ __ROR8__(-[CRDocumentOutputRegion hash](self->_topLevelRegion, "hash") ^ __ROR8__(-[VNDetectedObjectObservation hash](&v3, sel_hash), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  VNDocumentObservation *v4;
  VNDocumentObservation *v5;
  char v6;
  objc_super v8;

  v4 = (VNDocumentObservation *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VNDocumentObservation;
    if (-[VNDetectedObjectObservation isEqual:](&v8, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (-[CRDocumentOutputRegion isEqual:](self->_topLevelRegion, "isEqual:", v5->_topLevelRegion))
        v6 = -[NSArray isEqual:](self->_blocks, "isEqual:", v5->_blocks);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)getDataDetectorResults:(id *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  VNDataDetectorResult *v10;
  void *v11;
  VNDataDetectorResult *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  -[CRDocumentOutputRegion contentsWithTypes:](self->_topLevelRegion, "contentsWithTypes:", 2048);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v16;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v10 = [VNDataDetectorResult alloc];
          objc_msgSend(v9, "ddResult");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[VNDataDetectorResult initWithDDScannerResult:observation:](v10, "initWithDDScannerResult:observation:", v11, self);

          v13 = objc_msgSend(v9, "dataType");
          if ((unint64_t)(v13 - 1) >= 9)
            v14 = 0;
          else
            v14 = v13;
          -[VNDataDetectorResult setType:](v12, "setType:", v14);
          objc_msgSend(v4, "addObject:", v12);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

  }
  else
  {
    v4 = 0;
  }

  kdebug_trace();
  return v4;
}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNDocumentObservation;
  -[VNDetectedObjectObservation vn_cloneObject](&v9, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CRDocumentOutputRegion copy](self->_topLevelRegion, "copy");
    v5 = (void *)v3[20];
    v3[20] = v4;

    v6 = -[NSArray copy](self->_blocks, "copy");
    v7 = (void *)v3[21];
    v3[21] = v6;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNDocumentObservation;
  v4 = a3;
  -[VNDetectedObjectObservation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_topLevelRegion, CFSTR("topLevelRegion"), v5.receiver, v5.super_class);

}

- (VNDocumentObservation)initWithCoder:(id)a3
{
  id v4;
  VNDocumentObservation *v5;
  uint64_t v6;
  CRDocumentOutputRegion *topLevelRegion;
  VNDocumentObservation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNDocumentObservation;
  v5 = -[VNDetectedObjectObservation initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topLevelRegion")),
        v6 = objc_claimAutoreleasedReturnValue(),
        topLevelRegion = v5->_topLevelRegion,
        v5->_topLevelRegion = (CRDocumentOutputRegion *)v6,
        topLevelRegion,
        !v5->_topLevelRegion))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_topLevelRegion, 0);
}

BOOL __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke(CGRect *a1, void *a2)
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGRect v8;

  objc_msgSend(a2, "boundingBox");
  v8.origin.x = v3;
  v8.origin.y = v4;
  v8.size.width = v5;
  v8.size.height = v6;
  return CGRectIntersectsRect(a1[1], v8);
}

BOOL __50__VNDocumentObservation_blocksWithTypes_inRegion___block_invoke_2(CGRect *a1, void *a2)
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;

  objc_msgSend(a2, "boundingQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "boundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = 1.0 - v10 - v8;

  v13.origin.x = v5;
  v13.origin.y = v11;
  v13.size.width = v7;
  v13.size.height = v9;
  return CGRectIntersectsRect(a1[1], v13);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
