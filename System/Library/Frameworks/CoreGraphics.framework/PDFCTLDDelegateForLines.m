@implementation PDFCTLDDelegateForLines

- (PDFCTLDDelegateForLines)initWithPageLayout:(void *)a3 quadToPageTransform:(CGAffineTransform *)a4
{
  PDFCTLDDelegateForLines *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PDFCTLDDelegateForLines;
  result = -[PDFCTLDDelegateForLines init](&v9, sel_init);
  if (result)
  {
    result->_layout = a3;
    v7 = *(_OWORD *)&a4->a;
    v8 = *(_OWORD *)&a4->tx;
    *(_OWORD *)&result->_quadToPageTransform.c = *(_OWORD *)&a4->c;
    *(_OWORD *)&result->_quadToPageTransform.tx = v8;
    *(_OWORD *)&result->_quadToPageTransform.a = v7;
  }
  return result;
}

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __int128 v9;
  double x;
  double width;
  double height;
  void *v13;
  __int128 v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  double v24;
  void *layout;
  double *v26;
  double *v27;
  unint64_t v28;
  unint64_t v29;
  double *v30;
  double *v31;
  double v32;
  int64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double *v41;
  double *v42;
  unint64_t v43;
  unint64_t v44;
  double *v45;
  double *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double y;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
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
  CGRect v90;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "boundingQuad");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundingBox");
  v9 = *(_OWORD *)&self->_quadToPageTransform.c;
  *(_OWORD *)&v60.a = *(_OWORD *)&self->_quadToPageTransform.a;
  *(_OWORD *)&v60.c = v9;
  *(_OWORD *)&v60.tx = *(_OWORD *)&self->_quadToPageTransform.tx;
  v62 = CGRectApplyAffineTransform(v61, &v60);
  x = v62.origin.x;
  y = v62.origin.y;
  width = v62.size.width;
  height = v62.size.height;

  objc_msgSend(v7, "boundingQuad");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "boundingBox");
  v14 = *(_OWORD *)&self->_quadToPageTransform.c;
  *(_OWORD *)&v59.a = *(_OWORD *)&self->_quadToPageTransform.a;
  *(_OWORD *)&v59.c = v14;
  *(_OWORD *)&v59.tx = *(_OWORD *)&self->_quadToPageTransform.tx;
  v64 = CGRectApplyAffineTransform(v63, &v59);
  v56 = v64.origin.x;
  v57 = v64.origin.y;
  v15 = v64.size.width;
  v16 = v64.size.height;

  v17 = height;
  v18 = y;
  v53 = height;
  v19 = height < 0.0 || width < 0.0;
  v20 = x;
  v21 = width;
  if (v19)
  {
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    *(CGRect *)&v20 = CGRectStandardize(v65);
  }
  v22 = v20 + v21;
  v23 = v16 < 0.0 || v15 < 0.0;
  v54 = v15;
  v55 = v16;
  if (v23)
  {
    v66.origin.x = v56;
    v66.origin.y = v57;
    v66.size.width = v15;
    v66.size.height = v16;
    v24 = COERCE_DOUBLE(CGRectStandardize(v66));
    if (v22 >= v24)
    {
      v67.origin.x = v56;
      v67.origin.y = v57;
      v67.size.width = v15;
      v67.size.height = v55;
      v68 = CGRectStandardize(v67);
      v15 = v68.size.width;
      goto LABEL_13;
    }
  }
  else
  {
    v24 = v56;
    v68.origin.x = v56;
    if (v22 >= v56)
    {
LABEL_13:
      v22 = v68.origin.x + v15;
      v24 = x;
      if (v19)
      {
        v69.origin.x = x;
        v69.origin.y = y;
        v69.size.width = width;
        v69.size.height = v17;
        *(_QWORD *)&v24 = (unint64_t)CGRectStandardize(v69);
      }
      if (v22 >= v24)
        goto LABEL_36;
    }
  }
  layout = self->_layout;
  v26 = (double *)*((_QWORD *)layout + 57);
  v27 = (double *)*((_QWORD *)layout + 58);
  if (v27 != v26)
  {
    v28 = 0xAAAAAAAAAAAAAAABLL * (v27 - v26);
    do
    {
      v29 = v28 >> 1;
      v30 = &v26[3 * (v28 >> 1)];
      v32 = *v30;
      v31 = v30 + 3;
      v28 += ~(v28 >> 1);
      if (v32 < v22)
        v26 = v31;
      else
        v28 = v29;
    }
    while (v28);
  }
  if (v26 != v27)
  {
    v33 = 1;
    do
    {
      if (*v26 >= v24)
        break;
      v35 = v26[1];
      v34 = v26[2];
      if (v19)
      {
        v70.origin.x = x;
        v70.origin.y = y;
        v70.size.width = width;
        v70.size.height = v17;
        v71 = CGRectStandardize(v70);
        if (v35 > v71.origin.y + v71.size.height)
          goto LABEL_35;
        v72.origin.x = x;
        v72.origin.y = y;
        v72.size.width = width;
        v72.size.height = v17;
        v73 = CGRectStandardize(v72);
      }
      else
      {
        v73.origin.y = y;
        if (v35 > y + v53)
          goto LABEL_35;
      }
      if (v34 >= v73.origin.y)
      {
        if (v23)
        {
          v74.origin.x = v56;
          v74.origin.y = v57;
          v74.size.width = v54;
          v74.size.height = v55;
          v75 = CGRectStandardize(v74);
          if (v35 <= v75.origin.y + v75.size.height)
          {
            v76.origin.x = v56;
            v76.origin.y = v57;
            v76.size.width = v54;
            v76.size.height = v55;
            v77 = CGRectStandardize(v76);
LABEL_34:
            if (v34 >= v77.origin.y)
              goto LABEL_66;
          }
        }
        else
        {
          v77.origin.y = v57;
          if (v35 <= v57 + v55)
            goto LABEL_34;
        }
      }
LABEL_35:
      v26 += 3;
    }
    while (v26 != v27);
  }
LABEL_36:
  v36 = y;
  v37 = v53;
  if (v19)
  {
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = v17;
    *(CGRect *)(&v36 - 1) = CGRectStandardize(v78);
  }
  v38 = v36 + v37;
  if (v23)
  {
    v79.origin.x = v56;
    v79.origin.y = v57;
    v79.size.width = v54;
    v79.size.height = v55;
    v80 = CGRectStandardize(v79);
    v39 = v80.origin.y;
    if (v38 >= v80.origin.y)
    {
      v81.origin.x = v56;
      v81.origin.y = v57;
      v81.size.width = v54;
      v81.size.height = v55;
      v82 = CGRectStandardize(v81);
      goto LABEL_42;
    }
  }
  else
  {
    v39 = v57;
    v82.origin.y = v57;
    v82.size.height = v55;
    if (v38 >= v57)
    {
LABEL_42:
      v38 = v82.origin.y + v82.size.height;
      if (v19)
      {
        v83.origin.x = x;
        v83.origin.y = y;
        v83.size.width = width;
        v83.size.height = v17;
        v84 = CGRectStandardize(v83);
        y = v84.origin.y;
      }
      v39 = y;
      if (v38 >= y)
        goto LABEL_65;
    }
  }
  v40 = self->_layout;
  v41 = (double *)*((_QWORD *)v40 + 54);
  v42 = (double *)*((_QWORD *)v40 + 55);
  if (v42 != v41)
  {
    v43 = 0xAAAAAAAAAAAAAAABLL * (v42 - v41);
    do
    {
      v44 = v43 >> 1;
      v45 = &v41[3 * (v43 >> 1)];
      v47 = *v45;
      v46 = v45 + 3;
      v43 += ~(v43 >> 1);
      if (v47 < v38)
        v41 = v46;
      else
        v43 = v44;
    }
    while (v43);
  }
  if (v41 != v42)
  {
    v33 = 1;
    do
    {
      if (*v41 >= v39)
        break;
      v48 = v41[1];
      v49 = v41[2];
      if (v19)
      {
        v85.origin.x = x;
        v85.origin.y = v18;
        v85.size.width = width;
        v85.size.height = v17;
        v86 = CGRectStandardize(v85);
        if (v48 > v86.origin.x + v86.size.width)
          goto LABEL_64;
        v87.origin.x = x;
        v87.origin.y = v18;
        v87.size.width = width;
        v87.size.height = v17;
        *(_QWORD *)&v50 = (unint64_t)CGRectStandardize(v87);
      }
      else
      {
        v50 = x;
        if (v48 > x + width)
          goto LABEL_64;
      }
      if (v49 >= v50)
      {
        if (v23)
        {
          v88.origin.x = v56;
          v88.origin.y = v57;
          v88.size.width = v54;
          v88.size.height = v55;
          v89 = CGRectStandardize(v88);
          if (v48 <= v89.origin.x + v89.size.width)
          {
            v90.origin.x = v56;
            v90.origin.y = v57;
            v90.size.width = v54;
            v90.size.height = v55;
            *(_QWORD *)&v51 = (unint64_t)CGRectStandardize(v90);
LABEL_63:
            if (v49 >= v51)
              goto LABEL_66;
          }
        }
        else
        {
          v51 = v56;
          if (v48 <= v56 + v54)
            goto LABEL_63;
        }
      }
LABEL_64:
      v41 += 3;
    }
    while (v41 != v42);
  }
LABEL_65:
  v33 = 0;
LABEL_66:

  return v33;
}

@end
