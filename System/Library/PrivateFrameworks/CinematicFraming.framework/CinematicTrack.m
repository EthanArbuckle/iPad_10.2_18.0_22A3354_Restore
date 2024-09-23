@implementation CinematicTrack

- (CinematicTrack)initWithObservation:(id)a3 identifier:(int64_t)a4 options:(id)a5 atTime:(id *)a6
{
  char *v6;
  CinematicTrack *v7;
  __int128 v8;
  char *v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CinematicTrack;
  v11 = *a6;
  v6 = -[BaseTrack initWithObservation:identifier:type:atTime:](&v12, sel_initWithObservation_identifier_type_atTime_, a3, a4, 0, &v11);
  v7 = (CinematicTrack *)v6;
  if (v6)
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v6 + 184) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v6 + 200) = v8;
    v9 = v6;
  }

  return v7;
}

- (void)updatePropertiesWithTimestamp:(id *)a3 inView:(CGRect)a4
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;

  -[BaseTrack lastObservationBounds](self, "lastObservationBounds", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  self->_boundingBoxForFraming.origin.x = v5;
  self->_boundingBoxForFraming.origin.y = v6;
  self->_boundingBoxForFraming.size.width = v7;
  self->_boundingBoxForFraming.size.height = v8;
}

- (void)setAfterImage:(CGRect)a3 forDuration:(float)a4 atTime:(id *)a5
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_afterImageExpirationTimestamp;
  CMTime v7;
  CMTime rhs;
  CMTime v9;

  self->_afterImageBoundingBox = a3;
  p_afterImageExpirationTimestamp = &self->_afterImageExpirationTimestamp;
  CMTimeMake(&rhs, (uint64_t)(float)(a4 * 1000000.0), 1000000);
  v7 = *(CMTime *)a5;
  CMTimeAdd(&v9, &v7, &rhs);
  *(CMTime *)p_afterImageExpirationTimestamp = v9;
}

- (CGRect)afterImageBoundingBoxAtTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_afterImageExpirationTimestamp;
  CGRect *p_afterImageBoundingBox;
  double width;
  double height;
  double x;
  double y;
  $95D729B680665BEAEFA1D6FCA8238556 v11;
  CMTime time1;
  CGRect result;

  p_afterImageExpirationTimestamp = &self->_afterImageExpirationTimestamp;
  time1 = (CMTime)self->_afterImageExpirationTimestamp;
  v11 = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  if (CMTimeCompare(&time1, (CMTime *)&v11)
    && (time1 = (CMTime)*a3, v11 = *p_afterImageExpirationTimestamp, CMTimeCompare(&time1, (CMTime *)&v11) < 0))
  {
    p_afterImageBoundingBox = &self->_afterImageBoundingBox;
  }
  else
  {
    p_afterImageBoundingBox = (CGRect *)MEMORY[0x1E0C9D628];
  }
  width = p_afterImageBoundingBox->size.width;
  height = p_afterImageBoundingBox->size.height;
  x = p_afterImageBoundingBox->origin.x;
  y = p_afterImageBoundingBox->origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)resetProperties
{
  self->_afterImageExpirationTimestamp = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
}

- (CGRect)faceBoundingBoxForFramingAtTime:(id *)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double MinX;
  double v23;
  double MinY;
  double v25;
  double Width;
  double Height;
  CGFloat v28;
  CGRect *p_lastMeasuredFaceBoundingBox;
  BOOL v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  float v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat y;
  CGFloat v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  CGFloat rect;
  CGFloat recta;
  CGFloat rect_8;
  CGFloat rect_8a;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect result;

  -[BaseTrack pairTrack](self, "pairTrack", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[BaseTrack pairTrack](self, "pairTrack");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObservationBounds");
    v7 = v6;
    rect = v6;
    rect_8 = v8;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[BaseTrack lastObservationBounds](self, "lastObservationBounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v68.origin.x = v7;
    v68.origin.y = v9;
    v68.size.width = v11;
    v68.size.height = v13;
    MinX = CGRectGetMinX(v68);
    v69.origin.x = v15;
    v69.origin.y = v17;
    v69.size.width = v19;
    v69.size.height = v21;
    v23 = MinX - CGRectGetMinX(v69);
    v70.origin.x = v15;
    v70.origin.y = v17;
    v70.size.width = v19;
    v70.size.height = v21;
    v61 = v23 / CGRectGetWidth(v70);
    v71.origin.y = rect_8;
    v71.origin.x = rect;
    v71.size.width = v11;
    v71.size.height = v13;
    MinY = CGRectGetMinY(v71);
    v72.origin.x = v15;
    v72.origin.y = v17;
    v72.size.width = v19;
    v72.size.height = v21;
    v25 = MinY - CGRectGetMinY(v72);
    v73.origin.x = v15;
    v73.origin.y = v17;
    v73.size.width = v19;
    v73.size.height = v21;
    v60 = v25 / CGRectGetHeight(v73);
    v74.origin.x = rect;
    v74.origin.y = rect_8;
    v74.size.width = v11;
    v74.size.height = v13;
    Width = CGRectGetWidth(v74);
    v75.origin.x = v15;
    v75.origin.y = v17;
    v75.size.width = v19;
    v75.size.height = v21;
    v58 = Width / CGRectGetWidth(v75);
    v76.origin.x = rect;
    v76.origin.y = rect_8;
    v76.size.width = v11;
    v76.size.height = v13;
    Height = CGRectGetHeight(v76);
    v77.origin.x = v15;
    v77.origin.y = v17;
    v77.size.width = v19;
    v77.size.height = v21;
    v28 = CGRectGetHeight(v77);
    self->_lastMeasuredFaceBoundingBox.origin.x = v61;
    self->_lastMeasuredFaceBoundingBox.origin.y = v60;
    self->_lastMeasuredFaceBoundingBox.size.width = v58;
    self->_lastMeasuredFaceBoundingBox.size.height = Height / v28;

  }
  p_lastMeasuredFaceBoundingBox = &self->_lastMeasuredFaceBoundingBox;
  v30 = CGRectEqualToRect(self->_lastMeasuredFaceBoundingBox, *MEMORY[0x1E0C9D628]);
  -[CinematicTrack boundingBoxForFraming](self, "boundingBoxForFraming");
  v35 = v33;
  if (v30)
  {
    v36 = v33 / 3.0;
    v37 = v36;
    -[CinematicTrack boundingBoxForFraming](self, "boundingBoxForFraming");
    v38 = v37;
    if (v39 <= v37)
    {
      -[CinematicTrack boundingBoxForFraming](self, "boundingBoxForFraming");
      v41 = v40;
      v38 = v41;
    }
    -[CinematicTrack boundingBoxForFraming](self, "boundingBoxForFraming", *(_QWORD *)&v58);
    v42 = CGRectGetMidX(v78) + v37 * -0.5;
    -[CinematicTrack boundingBoxForFraming](self, "boundingBoxForFraming");
    v43 = CGRectGetMinY(v79);
  }
  else
  {
    v44 = v31;
    v45 = v32;
    v46 = v34;
    v80.origin.x = p_lastMeasuredFaceBoundingBox->origin.x;
    y = self->_lastMeasuredFaceBoundingBox.origin.y;
    rect_8a = p_lastMeasuredFaceBoundingBox->origin.x;
    v80.size.width = self->_lastMeasuredFaceBoundingBox.size.width;
    v48 = self->_lastMeasuredFaceBoundingBox.size.height;
    v59 = v80.size.width;
    v80.origin.y = y;
    v80.size.height = v48;
    v49 = CGRectGetMinX(v80);
    v81.origin.x = v44;
    v81.origin.y = v45;
    v81.size.width = v35;
    v81.size.height = v46;
    v50 = CGRectGetWidth(v81);
    v82.origin.x = v44;
    v82.origin.y = v45;
    v82.size.width = v35;
    v82.size.height = v46;
    recta = CGRectGetMinX(v82) + v49 * v50;
    v83.origin.x = rect_8a;
    v83.origin.y = y;
    v83.size.width = v59;
    v83.size.height = v48;
    v62 = CGRectGetMinY(v83);
    v84.origin.x = v44;
    v84.origin.y = v45;
    v84.size.width = v35;
    v84.size.height = v46;
    v51 = CGRectGetHeight(v84);
    v85.origin.x = v44;
    v85.origin.y = v45;
    v85.size.width = v35;
    v85.size.height = v46;
    v63 = CGRectGetMinY(v85) + v62 * v51;
    v86.origin.x = rect_8a;
    v86.origin.y = y;
    v86.size.width = v59;
    v86.size.height = v48;
    v52 = CGRectGetWidth(v86);
    v87.origin.x = v44;
    v87.origin.y = v45;
    v87.size.width = v35;
    v87.size.height = v46;
    v37 = v52 * CGRectGetWidth(v87);
    v88.origin.x = rect_8a;
    v88.origin.y = y;
    v88.size.width = v59;
    v88.size.height = v48;
    v53 = CGRectGetHeight(v88);
    v89.origin.x = v44;
    v42 = recta;
    v89.origin.y = v45;
    v89.size.width = v35;
    v89.size.height = v46;
    v54 = CGRectGetHeight(v89);
    v43 = v63;
    v38 = v53 * v54;
  }
  v55 = v42;
  v56 = v37;
  v57 = v38;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v43;
  result.origin.x = v55;
  return result;
}

- (BOOL)isTrackedByDirector
{
  return self->isTrackedByDirector;
}

- (void)setIsTrackedByDirector:(BOOL)a3
{
  self->isTrackedByDirector = a3;
}

- (CGRect)boundingBoxForFraming
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBoxForFraming.origin.x;
  y = self->_boundingBoxForFraming.origin.y;
  width = self->_boundingBoxForFraming.size.width;
  height = self->_boundingBoxForFraming.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBoxForFraming:(CGRect)a3
{
  self->_boundingBoxForFraming = a3;
}

@end
