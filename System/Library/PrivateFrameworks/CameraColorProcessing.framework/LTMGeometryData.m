@implementation LTMGeometryData

- (LTMGeometryData)initWithInputTextureWidth:(unint64_t)a3 height:(unint64_t)a4
{
  char *v6;
  void *v7;
  int64x2_t v8;
  LTMGeometryData *v9;
  NSObject *v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)LTMGeometryData;
  v6 = -[LTMGeometryData init](&v12, sel_init);
  v7 = v6;
  if (v6 && a3 >= 0x1E0 && a4 > 0x13F)
  {
    *((double *)v6 + 12) = (double)a3;
    *((double *)v6 + 13) = (double)a4;
    *((_QWORD *)v6 + 1) = 0;
    *((_QWORD *)v6 + 2) = 0;
    *((double *)v6 + 3) = (double)a3;
    *((double *)v6 + 4) = (double)a4;
    v8.i64[0] = a3;
    v8.i64[1] = a4;
    *(float64x2_t *)(v6 + 40) = vcvtq_f64_u64(vshrq_n_u64((uint64x2_t)vaddq_s64(v8, (int64x2_t)xmmword_2309319C0), 1uLL));
    *(_OWORD *)(v6 + 56) = xmmword_2309319D0;
    *((_QWORD *)v6 + 10) = 0;
    *((_QWORD *)v6 + 11) = 0;
    *((_DWORD *)v6 + 18) = 1065353216;
    v9 = v6;
  }
  else
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LTMGeometryData *v4;

  v4 = -[LTMGeometryData initWithInputTextureWidth:height:]([LTMGeometryData alloc], "initWithInputTextureWidth:height:", (unint64_t)self->_inputTextureSize.width, (unint64_t)self->_inputTextureSize.height);
  -[LTMGeometryData setCropRect:sourceRect:](v4, "setCropRect:sourceRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
  -[LTMGeometryData inputTextureDownsampleRatio](self, "inputTextureDownsampleRatio");
  -[LTMGeometryData setInputTextureDownsampleRatio:](v4, "setInputTextureDownsampleRatio:");
  -[LTMGeometryData deepZoomOrigin](self, "deepZoomOrigin");
  -[LTMGeometryData setDeepZoomOrigin:](v4, "setDeepZoomOrigin:");
  return v4;
}

- (void)setCropRect:(CGRect)a3 sourceRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  NSObject *v19;
  NSObject *v20;
  CGFloat v21;
  CGFloat v22;
  NSObject *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  NSObject *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  NSObject *v32;
  double v33;
  CGFloat v34;
  CGFloat rect2;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat r1;
  double v43;
  CGFloat v44;
  CGFloat rect1;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v46 = CGRectIntegral(a4);
  v9 = v46.origin.x;
  v34 = v46.origin.y;
  rect2 = v46.origin.x;
  v10 = v46.origin.y;
  v39 = v46.size.width;
  v11 = v46.size.height;
  v33 = v46.size.height;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v47 = CGRectIntegral(v46);
  v12 = v47.origin.x;
  v13 = v47.origin.y;
  v14 = v47.size.width;
  v15 = v47.size.height;
  v53.origin.x = v9;
  v53.origin.y = v10;
  v53.size.width = v39;
  v53.size.height = v11;
  v48 = CGRectIntersection(self->_inputTextureRect, v53);
  v16 = v48.origin.x;
  rect1 = v48.origin.y;
  v17 = v48.size.width;
  v18 = v48.size.height;
  v54.origin.x = v12;
  v54.origin.y = v13;
  v54.size.width = v14;
  v54.size.height = v15;
  v49 = CGRectIntersection(self->_inputTextureRect, v54);
  v40 = v49.origin.x;
  v37 = v49.size.width;
  v38 = v49.origin.y;
  v36 = v49.size.height;
  v43 = v16;
  v49.origin.x = v16;
  v55.origin.y = v34;
  v49.origin.y = rect1;
  v49.size.width = v17;
  v49.size.height = v18;
  v55.origin.x = rect2;
  v55.size.width = v39;
  v55.size.height = v33;
  if (!CGRectEqualToRect(v49, v55))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v19 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  v50.origin.x = v40;
  v56.origin.x = v12;
  v50.size.width = v37;
  v50.origin.y = v38;
  v50.size.height = v36;
  v56.origin.y = v13;
  v56.size.width = v14;
  v56.size.height = v15;
  r1 = v18;
  if (!CGRectEqualToRect(v50, v56))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v20 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  if (v39 < 480.0 || v33 < 320.0)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v23 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v22 = self->_minimumRect.origin.x;
    rect1 = self->_minimumRect.origin.y;
    v17 = self->_minimumRect.size.width;
    r1 = self->_minimumRect.size.height;
    v21 = v40;
  }
  else
  {
    v21 = v40;
    v22 = v43;
  }
  if (v14 < 480.0 || v15 < 320.0)
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v27 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v21 = self->_minimumRect.origin.x;
    v25 = self->_minimumRect.origin.y;
    v26 = self->_minimumRect.size.width;
    v24 = self->_minimumRect.size.height;
  }
  else
  {
    v24 = v36;
    v26 = v37;
    v25 = v38;
  }
  v44 = v22;
  v51.origin.x = v22;
  v51.origin.y = rect1;
  v41 = v17;
  v51.size.width = v17;
  v51.size.height = r1;
  v57.origin.x = v21;
  v57.origin.y = v25;
  v57.size.width = v26;
  v57.size.height = v24;
  v52 = CGRectIntersection(v51, v57);
  v28 = v52.origin.x;
  v29 = v52.origin.y;
  v30 = v52.size.width;
  v31 = v52.size.height;
  v52.origin.x = v21;
  v52.origin.y = v25;
  v52.size.width = v26;
  v52.size.height = v24;
  v58.origin.x = v28;
  v58.origin.y = v29;
  v58.size.width = v30;
  v58.size.height = v31;
  if (!CGRectEqualToRect(v52, v58))
  {
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v32 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

  }
  self->_cropRect.origin.x = v28;
  self->_cropRect.origin.y = v29;
  self->_cropRect.size.width = v30;
  self->_cropRect.size.height = v31;
  self->_sourceRect.origin.x = v44;
  self->_sourceRect.origin.y = rect1;
  self->_sourceRect.size.width = v41;
  self->_sourceRect.size.height = r1;
}

- (CGPoint)deepZoomOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_deepZoomOrigin.x;
  y = self->_deepZoomOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDeepZoomOrigin:(CGPoint)a3
{
  self->_deepZoomOrigin = a3;
}

- (float)inputTextureDownsampleRatio
{
  return self->_inputTextureDownsampleRatio;
}

- (void)setInputTextureDownsampleRatio:(float)a3
{
  self->_inputTextureDownsampleRatio = a3;
}

- (CGSize)inputTextureSize
{
  double width;
  double height;
  CGSize result;

  width = self->_inputTextureSize.width;
  height = self->_inputTextureSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
