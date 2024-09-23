@implementation AXMVisionFeatureFaceDetectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  double v22;
  _OWORD v23[4];
  id v24;

  v4 = a3;
  -[AXMVisionFeatureFaceDetectionResult uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AXMFeatureFaceUUID"));

  -[AXMVisionFeatureFaceDetectionResult frame](self, "frame");
  objc_msgSend(v4, "axmEncodeRect:forKey:", CFSTR("AXMFeatureFaceRectangles"));
  -[AXMVisionFeatureFaceDetectionResult rectanglesConfidence](self, "rectanglesConfidence");
  *(float *)&v6 = v6;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("AXMFeatureFaceRectanglesConfidence"), v6);
  -[AXMVisionFeatureFaceDetectionResult name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("AXMFeatureFaceName"));

  -[AXMVisionFeatureFaceDetectionResult nameConfidence](self, "nameConfidence");
  *(float *)&v8 = v8;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("AXMFeatureFaceNameConfidence "), v8);
  -[AXMVisionFeatureFaceDetectionResult attributes](self, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("AXMFeatureFaceAttributes"));

  -[AXMVisionFeatureFaceDetectionResult attributesConfidence](self, "attributesConfidence");
  *(float *)&v10 = v10;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("AXMFeatureFaceAttributesConfidence"), v10);
  v11 = (void *)MEMORY[0x1E0CB36F8];
  -[AXMVisionFeatureFaceDetectionResult expressionsAndConfidence](self, "expressionsAndConfidence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v24;

  if (v14)
  {
    AXMediaLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AXMVisionFeatureFaceDetectionResult encodeWithCoder:].cold.1((uint64_t)v14, v15);

  }
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("AXMFeatureFaceExpressions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarks, CFSTR("AXMFeatureFaceLandmarks"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarks3d, CFSTR("AXMFeatureFaceLandmarks3d"));
  -[AXMVisionFeatureFaceDetectionResult landmarksConfidence](self, "landmarksConfidence");
  *(float *)&v16 = v16;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("AXMFeatureFaceLandmarksConfidence"), v16);
  -[AXMVisionFeatureFaceDetectionResult pose](self, "pose");
  v23[0] = v17;
  v23[1] = v18;
  v23[2] = v19;
  v23[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 64);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("AXMFeatureFacePose"));
  -[AXMVisionFeatureFaceDetectionResult poseConfidence](self, "poseConfidence");
  *(float *)&v22 = v22;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("AXMVisionFeatureCodingKeyFacePoseConfidence"), v22);

}

- (AXMVisionFeatureFaceDetectionResult)initWithCoder:(id)a3
{
  id v4;
  AXMVisionFeatureFaceDetectionResult *v5;
  void *v6;
  float v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  float v22;
  void *v23;
  float v24;
  id v26;
  objc_super v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  double v31[3];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)AXMVisionFeatureFaceDetectionResult;
  v5 = -[AXMVisionFeatureFaceDetectionResult init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXMFeatureFaceUUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceDetectionResult setUuid:](v5, "setUuid:", v6);

    objc_msgSend(v4, "axmDecodeRectForKey:", CFSTR("AXMFeatureFaceRectangles"));
    -[AXMVisionFeatureFaceDetectionResult setFrame:](v5, "setFrame:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXMFeatureFaceRectanglesConfidence"));
    -[AXMVisionFeatureFaceDetectionResult setRectanglesConfidence:](v5, "setRectanglesConfidence:", v7);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXMFeatureFaceName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceDetectionResult setName:](v5, "setName:", v8);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXMFeatureFaceNameConfidence "));
    -[AXMVisionFeatureFaceDetectionResult setNameConfidence:](v5, "setNameConfidence:", v9);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXMFeatureFaceAttributes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceDetectionResult setAttributes:](v5, "setAttributes:", v10);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXMFeatureFaceAttributesConfidence"));
    -[AXMVisionFeatureFaceDetectionResult setAttributesConfidence:](v5, "setAttributesConfidence:", v11);
    AXMSecureCodingClasses();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("AXMFeatureFaceExpressions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3710];
      v15 = objc_opt_class();
      AXMSecureCodingClasses();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(v14, "axmSecurelyUnarchiveData:withExpectedClass:otherAllowedClasses:error:", v13, v15, v16, &v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v26;

      if (v18)
      {
        AXMediaLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl(&dword_1B0E3B000, v19, OS_LOG_TYPE_DEFAULT, "Error decoding face expression dict: %@", buf, 0xCu);
        }

      }
      else
      {
        -[AXMVisionFeatureFaceDetectionResult setExpressionsAndConfidence:](v5, "setExpressionsAndConfidence:", v17);
      }

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXMFeatureFaceLandmarks"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceDetectionResult setLandmarks:](v5, "setLandmarks:", v20);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXMFeatureFaceLandmarks3d"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMVisionFeatureFaceDetectionResult setLandmarks3d:](v5, "setLandmarks3d:", v21);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXMFeatureFaceLandmarksConfidence"));
    -[AXMVisionFeatureFaceDetectionResult setLandmarksConfidence:](v5, "setLandmarksConfidence:", v22);
    v30 = 0u;
    *(_OWORD *)v31 = 0u;
    *(_OWORD *)buf = 0u;
    v29 = 0u;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AXMFeatureFacePose"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "getBytes:length:", buf, 64);
    -[AXMVisionFeatureFaceDetectionResult setPose:](v5, "setPose:", *(double *)buf, *(double *)&v29, *(double *)&v30, v31[0]);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("AXMVisionFeatureCodingKeyFacePoseConfidence"));
    -[AXMVisionFeatureFaceDetectionResult setPoseConfidence:](v5, "setPoseConfidence:", v24);

  }
  return v5;
}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXMVisionFeatureFaceDetectionResult;
  result = -[AXMVisionFeatureFaceDetectionResult init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 1) = 0;
  return result;
}

+ (id)nameForFaceExpression:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_1E625DA88[a3 - 1];
}

- (double)confidenceForExpression:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  -[AXMVisionFeatureFaceDetectionResult descriptionForExpression:](self, "descriptionForExpression:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[AXMVisionFeatureFaceDetectionResult expressionsAndConfidence](self, "expressionsAndConfidence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (int64_t)likelyExpression
{
  int64_t likelyExpression;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  likelyExpression = self->_likelyExpression;
  if (!likelyExpression)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[AXMVisionFeatureFaceDetectionResult expressionsAndConfidence](self, "expressionsAndConfidence", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      likelyExpression = 0;
      v8 = *(_QWORD *)v18;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[AXMVisionFeatureFaceDetectionResult expressionsAndConfidence](self, "expressionsAndConfidence");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "floatValue");
          v15 = v14;

          if (v9 < v15)
          {
            likelyExpression = -[AXMVisionFeatureFaceDetectionResult _expressionForString:](self, "_expressionForString:", v11);
            v9 = v15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }
    else
    {
      likelyExpression = 0;
    }

    self->_likelyExpression = likelyExpression;
  }
  return likelyExpression;
}

+ (id)localizedStringFormatterForExpression:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  switch(objc_msgSend(a3, "integerValue"))
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("photo.description.expression.disgust");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("photo.description.expression.scream");
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("photo.description.expression.smile");
      goto LABEL_7;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("photo.description.expression.surprise");
      goto LABEL_7;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.accessibility.AXMediaUtilities"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("photo.description.expression.suspicious");
LABEL_7:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E6260C18, CFSTR("Accessibility"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)descriptionForExpression:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return off_1E625DA88[a3 - 1];
}

- (int64_t)_expressionForString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disgust")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Neutral")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scream")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Smile")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Surprise")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Suspicious")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(unint64_t)a3
{
  self->_faceId = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (double)rectanglesConfidence
{
  return self->_rectanglesConfidence;
}

- (void)setRectanglesConfidence:(double)a3
{
  self->_rectanglesConfidence = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)nameConfidence
{
  return self->_nameConfidence;
}

- (void)setNameConfidence:(double)a3
{
  self->_nameConfidence = a3;
}

- (AXMVisionFeatureFaceAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (double)attributesConfidence
{
  return self->_attributesConfidence;
}

- (void)setAttributesConfidence:(double)a3
{
  self->_attributesConfidence = a3;
}

- (NSDictionary)expressionsAndConfidence
{
  return self->_expressionsAndConfidence;
}

- (void)setExpressionsAndConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_expressionsAndConfidence, a3);
}

- (AXMVisionFeatureFaceLandmarks)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
  objc_storeStrong((id *)&self->_landmarks, a3);
}

- (AXMVisionFeatureFaceLandmarks)landmarks3d
{
  return self->_landmarks3d;
}

- (void)setLandmarks3d:(id)a3
{
  objc_storeStrong((id *)&self->_landmarks3d, a3);
}

- (double)landmarksConfidence
{
  return self->_landmarksConfidence;
}

- (void)setLandmarksConfidence:(double)a3
{
  self->_landmarksConfidence = a3;
}

- (__n128)pose
{
  return a1[9];
}

- (__n128)setPose:(__n128)a3
{
  result[9] = a2;
  result[10] = a3;
  result[11] = a4;
  result[12] = a5;
  return result;
}

- (double)poseConfidence
{
  return self->_poseConfidence;
}

- (void)setPoseConfidence:(double)a3
{
  self->_poseConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landmarks3d, 0);
  objc_storeStrong((id *)&self->_landmarks, 0);
  objc_storeStrong((id *)&self->_expressionsAndConfidence, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Failed to archive expressionsAndConfidence data: %@", (uint8_t *)&v2, 0xCu);
}

@end
