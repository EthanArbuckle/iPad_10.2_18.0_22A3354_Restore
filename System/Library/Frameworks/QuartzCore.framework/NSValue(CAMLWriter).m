@implementation NSValue(CAMLWriter)

- (const)CAMLType
{
  const char *v1;
  const char *v2;

  v1 = (const char *)objc_msgSend(a1, "objCType");
  v2 = v1;
  if (!v1)
    goto LABEL_21;
  if (!strcmp(v1, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    return CFSTR("CGRect");
  if (!strcmp(v2, "{CGPoint=dd}"))
    return CFSTR("CGPoint");
  if (!strcmp(v2, "{CGSize=dd}"))
    return CFSTR("CGSize");
  if (!strcmp(v2, "{CAPoint3D=ddd}"))
    return CFSTR("CAPoint3D");
  if (!strcmp(v2, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
    return CFSTR("CACornerRadii");
  if (!strcmp(v2, "{CGAffineTransform=dddddd}"))
    return CFSTR("CGAffineTransform");
  if (!strcmp(v2, "{CATransform3D=dddddddddddddddd}"))
    return CFSTR("CATransform3D");
LABEL_21:
  if (!strcmp(v2, "{CAColorMatrix=ffffffffffffffffffff}"))
    return CFSTR("CAColorMatrix");
  return CFSTR("NSValue");
}

- (void)encodeWithCAMLWriter:()CAMLWriter
{
  const char *v5;
  const char *v6;
  CFStringRef v7;
  CFStringRef v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __CFString *Mutable;
  CFIndex Length;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[8];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  CFRange v51;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend(a1, "objCType");
  v6 = v5;
  if (!v5)
  {
LABEL_9:
    if (strcmp(v6, "{CAColorMatrix=ffffffffffffffffffff}"))
      return;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    if (a1)
      objc_msgSend(a1, "CAColorMatrixValue");
    v7 = CACreateStringWithFloatArray((uint64_t)&v41, 0x14uLL, 0.000001);
    if (v7)
      goto LABEL_13;
    goto LABEL_59;
  }
  if (!strcmp(v5, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    objc_msgSend(a1, "rectValue");
    *(_QWORD *)&v41 = v10;
    *((_QWORD *)&v41 + 1) = v11;
    *(_QWORD *)&v42 = v12;
    *((_QWORD *)&v42 + 1) = v13;
    v14 = 4;
LABEL_18:
    v9 = (__CFString *)CACreateStringWithDoubleArray((uint64_t)&v41, v14, 1.0e-12);
    goto LABEL_19;
  }
  if (!strcmp(v6, "{CGPoint=dd}"))
  {
    objc_msgSend(a1, "pointValue");
LABEL_17:
    *(_QWORD *)&v41 = v15;
    *((_QWORD *)&v41 + 1) = v16;
    v14 = 2;
    goto LABEL_18;
  }
  if (!strcmp(v6, "{CGSize=dd}"))
  {
    objc_msgSend(a1, "sizeValue");
    goto LABEL_17;
  }
  if (!strcmp(v6, "{CAPoint3D=ddd}"))
  {
    objc_msgSend(a1, "CAPoint3DValue");
    *(_QWORD *)&v41 = v17;
    *((_QWORD *)&v41 + 1) = v18;
    *(_QWORD *)&v42 = v19;
    v14 = 3;
    goto LABEL_18;
  }
  if (!strcmp(v6, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    if (a1)
      objc_msgSend(a1, "CACornerRadiiValue");
    v14 = 8;
    goto LABEL_18;
  }
  if (!strcmp(v6, "{CGAffineTransform=dddddd}"))
  {
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    if (a1)
      objc_msgSend(a1, "CA_CGAffineTransformValue");
    v7 = CACreateStringWithDoubleArray((uint64_t)&v41, 6uLL, 1.0e-12);
LABEL_13:
    v8 = v7;
    v9 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("matrix(%@)"), v7);
    CFRelease(v8);
    goto LABEL_19;
  }
  if (strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
    goto LABEL_9;
  v20 = 0uLL;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v21 = 0uLL;
  v22 = 0uLL;
  v23 = 0uLL;
  v42 = 0u;
  v43 = 0u;
  v24 = 0uLL;
  v25 = 0uLL;
  v26 = 0uLL;
  v27 = 0uLL;
  v41 = 0u;
  if (a1)
  {
    objc_msgSend(a1, "CATransform3DValue");
    v27 = v32;
    v26 = v33;
    v25 = v34;
    v24 = v35;
    v23 = v36;
    v22 = v37;
    v21 = v38;
    v20 = v39;
  }
  v40[0] = v27;
  v40[1] = v26;
  v40[2] = v25;
  v40[3] = v24;
  v40[4] = v23;
  v40[5] = v22;
  v40[6] = v21;
  v40[7] = v20;
  CA::Mat4Impl::mat4_get_unmatrix((double *)v40, (uint64_t)&v41, 0);
  if (fabs(*((double *)&v45 + 1)) < 1.0e-12
    && fabs(*(double *)&v46) < 1.0e-12
    && fabs(*(double *)&v47 + -1.0) < 1.0e-12)
  {
    Mutable = CFStringCreateMutable(0, 0);
    v9 = Mutable;
    if (*((double *)&v46 + 1) != 0.0)
      CFStringAppendFormat(Mutable, 0, CFSTR("perspective(%g) "), -1.0 / *((double *)&v46 + 1));
    if (fabs(*(double *)&v44) >= 1.0e-12 || fabs(*((double *)&v44 + 1)) >= 1.0e-12 || fabs(*(double *)&v45) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("translate(%g, %g, %g) "), v44, (_QWORD)v45);
    if (fabs(*((double *)&v48 + 1)) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("rotate(%gdeg) "), *((double *)&v48 + 1) * 57.2957795);
    if (fabs(*(double *)&v48) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("rotate(%gdeg, 0, 1, 0) "), *(double *)&v48 * 57.2957795);
    if (fabs(*((double *)&v47 + 1)) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("rotate(%gdeg, 1, 0, 0) "), *((double *)&v47 + 1) * 57.2957795);
    if (fabs(*((double *)&v43 + 1)) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("shearYZ(%gdeg) "), *((double *)&v43 + 1) * 57.2957795);
    if (fabs(*(double *)&v43) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("shearXZ(%gdeg) "), *(double *)&v43 * 57.2957795);
    if (fabs(*((double *)&v42 + 1)) >= 1.0e-12)
      CFStringAppendFormat(v9, 0, CFSTR("shearXY(%gdeg) "), *((double *)&v42 + 1) * 57.2957795);
    if (fabs(*(double *)&v41 + -1.0) >= 1.0e-12
      || fabs(*((double *)&v41 + 1) + -1.0) >= 1.0e-12
      || fabs(*(double *)&v42 + -1.0) >= 1.0e-12)
    {
      if (vabdd_f64(*(double *)&v41, *((double *)&v41 + 1)) >= 1.0e-12
        || vabdd_f64(*(double *)&v41, *(double *)&v42) >= 1.0e-12)
      {
        CFStringAppendFormat(v9, 0, CFSTR("scale(%g, %g, %g) "), v41, (_QWORD)v42);
      }
      else
      {
        CFStringAppendFormat(v9, 0, CFSTR("scale(%g) "), (_QWORD)v41, v30, v31);
      }
    }
    Length = CFStringGetLength(v9);
    if (Length)
    {
      v51.location = Length - 1;
      v51.length = 1;
      CFStringReplace(v9, v51, &stru_1E15B0530);
    }
    goto LABEL_19;
  }
  v7 = CACreateStringWithDoubleArray((uint64_t)v40, 0x10uLL, 1.0e-12);
  if (v7)
    goto LABEL_13;
LABEL_59:
  v9 = 0;
LABEL_19:
  if (v9)
  {
    objc_msgSend(a3, "setElementContent:", v9);
    CFRelease(v9);
  }
}

@end
