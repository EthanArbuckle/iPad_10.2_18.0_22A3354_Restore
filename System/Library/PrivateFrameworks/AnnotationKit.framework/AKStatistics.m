@implementation AKStatistics

- (void)resetLogging
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD14E0], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AKStatistics setAnnotationsCounts:](self, "setAnnotationsCounts:", v3);

}

- (void)logAnnotationAdded:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[AKStatistics annotationsCounts](self, "annotationsCounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AKStatistics clientPrefix](self, "clientPrefix");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5
      || (v6 = (void *)v5,
          -[AKStatistics documentType](self, "documentType"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          !v7))
    {
      NSLog(CFSTR("WARNING: Missing prefix or document type!"));
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "nameForAnnotation:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKStatistics annotationsCounts](self, "annotationsCounts");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v8);

      }
    }
  }

}

- (void)logInkAnnotationStrokeAdded:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[AKStatistics clientPrefix](self, "clientPrefix");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[AKStatistics documentType](self, "documentType"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    NSLog(CFSTR("WARNING: Missing prefix or document type!"));
  }
  objc_msgSend((id)objc_opt_class(), "nameForClassName:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[AKStatistics annotationsCounts](self, "annotationsCounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)_logCoreAnalyticsAction:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)_logCoreAnalyticsHUDPickActionForAnnotationType:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)_logCoreAnalyticsAnnotationCreateActionForAnnotationType:(id)a3 count:(unint64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

- (void)logShapeDetectionHUDShown
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[AKStatistics clientPrefix](self, "clientPrefix");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[AKStatistics documentType](self, "documentType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    NSLog(CFSTR("WARNING: Missing prefix or document type!"));
  }
  -[AKStatistics _logCoreAnalyticsAction:](self, "_logCoreAnalyticsAction:", CFSTR("shapeDetectionShown"));
}

- (void)logShapeDetectionHUDPickedShape:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "nameForAnnotation:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AKStatistics clientPrefix](self, "clientPrefix");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        -[AKStatistics documentType](self, "documentType"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    NSLog(CFSTR("WARNING: Missing prefix or document type!"));
  }
  -[AKStatistics _logCoreAnalyticsHUDPickActionForAnnotationType:](self, "_logCoreAnalyticsHUDPickActionForAnnotationType:", v8);

}

- (void)logDocumentSaved
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[AKStatistics clientPrefix](self, "clientPrefix");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[AKStatistics documentType](self, "documentType"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    NSLog(CFSTR("WARNING: Missing prefix or document type!"));
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AKStatistics annotationsCounts](self, "annotationsCounts", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        -[AKStatistics annotationsCounts](self, "annotationsCounts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countForObject:", v11);

        -[AKStatistics _logCoreAnalyticsAnnotationCreateActionForAnnotationType:count:](self, "_logCoreAnalyticsAnnotationCreateActionForAnnotationType:count:", v11, v13);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[AKStatistics _logCoreAnalyticsAction:](self, "_logCoreAnalyticsAction:", CFSTR("save"));
}

+ (id)nameForClassName:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("AK"), &stru_24F1A83D0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Annotation"), &stru_24F1A83D0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nameForAnnotation:(id)a3
{
  id v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v9;
  objc_class *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = v3;
    v9 = objc_msgSend(v5, "arrowHeadStyle");
    if ((unint64_t)(v9 - 1) < 2)
    {
      v7 = CFSTR("SingleArrow");
      goto LABEL_5;
    }
    if (!v9)
    {
      v7 = CFSTR("Line");
      goto LABEL_5;
    }
    if (v9 == 3)
    {
      v7 = CFSTR("DoubleArrow");
      goto LABEL_5;
    }
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "nameForClassName:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (__CFString *)v6;
LABEL_5:

  return v7;
}

- (NSString)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(id)a3
{
  objc_storeStrong((id *)&self->_documentType, a3);
}

- (NSString)clientPrefix
{
  return self->_clientPrefix;
}

- (void)setClientPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_clientPrefix, a3);
}

- (NSCountedSet)annotationsCounts
{
  return self->_annotationsCounts;
}

- (void)setAnnotationsCounts:(id)a3
{
  objc_storeStrong((id *)&self->_annotationsCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationsCounts, 0);
  objc_storeStrong((id *)&self->_clientPrefix, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
}

@end
