@implementation CALayer(NeutrinoUIDebugging)

- (void)_nu_recursiveDescriptionWithLevel:()NeutrinoUIDebugging result:
{
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CATransform3D v27;
  CATransform3D v28;
  CATransform3D v29;
  _BYTE v30[128];
  uint64_t v31;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3 >= 1)
  {
    v7 = a3;
    do
    {
      objc_msgSend(v6, "appendFormat:", CFSTR(" | "));
      --v7;
    }
    while (v7);
  }
  memset(&v29, 0, sizeof(v29));
  objc_msgSend(a1, "transform");
  v28 = v29;
  if (CATransform3DIsIdentity(&v28))
  {
    v8 = &stru_24C625B60;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", %@ = {{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}"), CFSTR("transform"), *(_OWORD *)&v29.m11, *(_OWORD *)&v29.m13, *(_OWORD *)&v29.m21, *(_OWORD *)&v29.m23, *(_OWORD *)&v29.m31, *(_OWORD *)&v29.m33, *(_OWORD *)&v29.m41, *(_OWORD *)&v29.m43);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  memset(&v28, 0, sizeof(v28));
  objc_msgSend(a1, "sublayerTransform");
  v27 = v28;
  v22 = a3;
  if (CATransform3DIsIdentity(&v27))
  {
    v9 = &stru_24C625B60;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(", %@ = {{%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}, {%g, %g, %g, %g}}"), CFSTR("sublayerTransform"), *(_QWORD *)&v28.m11, *(_QWORD *)&v28.m12, *(_QWORD *)&v28.m13, *(_QWORD *)&v28.m14, *(_QWORD *)&v28.m21, *(_QWORD *)&v28.m22, *(_QWORD *)&v28.m23, *(_QWORD *)&v28.m24, *(_QWORD *)&v28.m31, *(_QWORD *)&v28.m32, *(_QWORD *)&v28.m33, *(_QWORD *)&v28.m34, *(_QWORD *)&v28.m41, *(_QWORD *)&v28.m42, *(_QWORD *)&v28.m43,
      *(_QWORD *)&v28.m44);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frame");
  NSStringFromCGRect(v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  NSStringFromCGRect(v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isHidden"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(a1, "position");
  NSStringFromCGPoint(v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anchorPoint");
  NSStringFromCGPoint(v33);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("<%p %@> frame = %@, bounds = %@%@%@, isHidden = %@, position = %@, anchor = %@\n"), a1, v11, v12, v13, v8, v9, v14, v15, v16);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "sublayers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "_nu_recursiveDescriptionWithLevel:result:", v22 + 1, v6);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v19);
  }

}

- (id)nu_layerRecursiveDescription
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(a1, "_nu_recursiveDescriptionWithLevel:result:", 0, v2);
  return v2;
}

@end
