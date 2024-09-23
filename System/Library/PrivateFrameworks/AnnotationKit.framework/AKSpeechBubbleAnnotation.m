@implementation AKSpeechBubbleAnnotation

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("pointyBitPoint")) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("pointyBitBaseWidthAngle"))
    || (+[AKController akBundle](AKController, "akBundle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Speech Bubble Tail"), &stru_24F1A83D0, CFSTR("AnnotationStrings")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___AKSpeechBubbleAnnotation;
    objc_msgSendSuper2(&v8, sel_displayNameForUndoablePropertyChangeWithKey_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)displayName
{
  void *v2;
  void *v3;

  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Speech Bubble"), &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)keysForValuesToObserveForUndo
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKSpeechBubbleAnnotation;
  -[AKThoughtBubbleAnnotation keysForValuesToObserveForUndo](&v6, sel_keysForValuesToObserveForUndo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEFD0);
  return v4;
}

- (id)keysForValuesToObserveForRedrawing
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKSpeechBubbleAnnotation;
  -[AKThoughtBubbleAnnotation keysForValuesToObserveForRedrawing](&v6, sel_keysForValuesToObserveForRedrawing);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CEFE8);
  return v4;
}

- (id)keysForValuesToObserveForAdornments
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v6.receiver = self;
  v6.super_class = (Class)AKSpeechBubbleAnnotation;
  -[AKThoughtBubbleAnnotation keysForValuesToObserveForAdornments](&v6, sel_keysForValuesToObserveForAdornments);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", &unk_24F1CF000);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKSpeechBubbleAnnotation;
  v4 = a3;
  -[AKThoughtBubbleAnnotation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  -[AKSpeechBubbleAnnotation pointyBitBaseWidthAngle](self, "pointyBitBaseWidthAngle", v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("pointyBitBaseWidthAngle"));

}

- (AKSpeechBubbleAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKSpeechBubbleAnnotation *v5;
  AKSpeechBubbleAnnotation *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AKSpeechBubbleAnnotation;
  v5 = -[AKThoughtBubbleAnnotation initWithCoder:](&v8, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[AKSpeechBubbleAnnotation setPointyBitBaseWidthAngle:](v5, "setPointyBitBaseWidthAngle:", 20.0);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pointyBitBaseWidthAngle")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("pointyBitBaseWidthAngle"));
      -[AKSpeechBubbleAnnotation setPointyBitBaseWidthAngle:](v6, "setPointyBitBaseWidthAngle:");
    }
  }

  return v6;
}

- (double)pointyBitBaseWidthAngle
{
  return self->_pointyBitBaseWidthAngle;
}

- (void)setPointyBitBaseWidthAngle:(double)a3
{
  self->_pointyBitBaseWidthAngle = a3;
}

@end
