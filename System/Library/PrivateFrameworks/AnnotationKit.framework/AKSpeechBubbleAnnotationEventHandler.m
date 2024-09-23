@implementation AKSpeechBubbleAnnotationEventHandler

- (void)getInitialDraggedPoint:(CGPoint *)a3 otherPoint:(CGPoint *)a4 center:(CGPoint *)a5 forEvent:(id)a6 orRecognizer:(id)a7
{
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  CGPoint *v17;
  CGFloat MidX;
  CGFloat MidY;
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[2];
  CGPoint v23;
  CGPoint v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  v12 = a6;
  v13 = a7;
  v24 = (CGPoint)*MEMORY[0x24BDBEFB0];
  v25 = v24;
  v23 = v24;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea");
  if (v15 - 1 < 8 || v15 == 14)
  {
    v20.receiver = self;
    v20.super_class = (Class)AKSpeechBubbleAnnotationEventHandler;
    -[AKThoughtBubbleAnnotationEventHandler getInitialDraggedPoint:otherPoint:center:forEvent:orRecognizer:](&v20, sel_getInitialDraggedPoint_otherPoint_center_forEvent_orRecognizer_, &v25, &v24, &v23, v12, v13);
  }
  else if (v15 == 15)
  {
    -[AKAnnotationEventHandler pageController](self, "pageController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    +[AKSpeechBubbleAnnotationRenderer basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:](AKSpeechBubbleAnnotationRenderer, "basePointsOfPointyBit:withUpdatedProperties:firstPoint:secondPoint:", v14, 0, v22, v21);
    if (+[AKGeometryHelper exifOrientationHasFlip:](AKGeometryHelper, "exifOrientationHasFlip:", objc_msgSend(v16, "currentModelToScreenExifOrientation")))
    {
      v17 = (CGPoint *)v21;
    }
    else
    {
      v17 = (CGPoint *)v22;
    }
    v25 = *v17;
    objc_msgSend(v14, "rectangle");
    MidX = CGRectGetMidX(v26);
    objc_msgSend(v14, "rectangle");
    MidY = CGRectGetMidY(v27);
    v23.x = MidX;
    v23.y = MidY;
    v24 = v23;

  }
  *a3 = v25;
  *a4 = v24;
  *a5 = v23;

}

- (void)updateModelWithCurrentPoint:(CGPoint)a3 options:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19[4];

  y = a3.y;
  x = a3.x;
  -[AKAnnotationEventHandler annotation](self, "annotation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v19[1], 0, 48);
  objc_msgSend(v8, "rectangle");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "rotationAngle");
  +[AKGeometryHelper rotationTransformForRect:withAngle:](AKGeometryHelper, "rotationTransformForRect:withAngle:", v10, v12, v14, v16, -v17);
  -[AKAnnotationEventHandler pageController](self, "pageController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea") == 15)
  {
    +[AKAnnotationPointOfInterestHelper validatePoint:ofDraggableArea:forAnnotation:onPageController:](AKAnnotationPointOfInterestHelper, "validatePoint:ofDraggableArea:forAnnotation:onPageController:", -[AKAnnotationEventHandler initiallyDraggedArea](self, "initiallyDraggedArea"), v8, v18, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
    +[AKSpeechBubbleAnnotationRenderer pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:](AKSpeechBubbleAnnotationRenderer, "pointyBitPointWidthAngleGivenControlBasePoint:forAnnotation:", v8);
    objc_msgSend(v8, "setPointyBitBaseWidthAngle:");
  }
  else
  {
    v19[0].receiver = self;
    v19[0].super_class = (Class)AKSpeechBubbleAnnotationEventHandler;
    -[objc_super updateModelWithCurrentPoint:options:](v19, sel_updateModelWithCurrentPoint_options_, a4, x, y);
  }

}

@end
