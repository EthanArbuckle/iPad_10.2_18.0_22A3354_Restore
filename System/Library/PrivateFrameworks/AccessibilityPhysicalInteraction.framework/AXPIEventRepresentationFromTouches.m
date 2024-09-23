@implementation AXPIEventRepresentationFromTouches

void __AXPIEventRepresentationFromTouches_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  unsigned __int8 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v34 = a3;
  v5 = a2;
  objc_msgSend(v34, "normalizedLocation");
  v7 = v6;
  v9 = v8;
  v10 = objc_alloc_init(MEMORY[0x24BE00608]);
  objc_msgSend(v10, "setPathIndex:", objc_msgSend(v5, "unsignedIntegerValue"));
  v11 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v10, "setPathIdentity:", v11);
  v12 = fmin(v9, 1.0);
  if (v12 >= 0.0)
    v13 = v12;
  else
    v13 = 0.0;
  v14 = fmin(v7, 1.0);
  if (v14 >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "_referenceBounds");
  v17 = v15 * v16;
  v19 = v13 * v18;
  objc_msgSend(*(id *)(a1 + 32), "scale");
  v21 = v20 * v17;
  v22 = roundf(v21);
  *(float *)&v20 = v20 * v19;
  v23 = roundf(*(float *)&v20);
  objc_msgSend(*(id *)(a1 + 32), "currentMode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  v26 = v25;
  v28 = v27;

  objc_msgSend(v10, "setPathLocation:", v22 / v26, v23 / v28);
  objc_msgSend(v10, "setTransducerType:", 2);
  if ((*(_DWORD *)(a1 + 48) - 1) > 1)
  {
    LODWORD(v29) = 0;
    objc_msgSend(v10, "setPathMajorRadius:", v29);
    LODWORD(v33) = 0;
    objc_msgSend(v10, "setPathPressure:", v33);
  }
  else
  {
    LODWORD(v29) = 1028443341;
    objc_msgSend(v10, "setPathMajorRadius:", v29);
    objc_msgSend(v34, "force");
    *(float *)&v30 = v30;
    objc_msgSend(v10, "setPathPressure:", v30);
    objc_msgSend(v34, "force");
    *(float *)&v31 = v31;
    objc_msgSend(v10, "setOrbValue:", v31);
    objc_msgSend(v34, "force");
    if (v32 > 0.0)
      objc_msgSend(v10, "setPathProximity:", 3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v10);

}

@end
