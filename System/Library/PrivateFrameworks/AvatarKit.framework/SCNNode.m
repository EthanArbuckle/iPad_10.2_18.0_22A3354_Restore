@implementation SCNNode

void __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  avt_enableSubdivisionOnHierarchyWithQuality_animoji__disableSubdivision = objc_msgSend(v0, "BOOLForKey:", CFSTR("avatarKit.disableSubdivision"));

}

void __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke_2()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
    avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality = 1;
}

void __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v12, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_BYTE *)(a1 + 40)
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("L_eye")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("R_eye")) & 1) == 0)
    {
      if (objc_msgSend(v5, "hasSuffix:", CFSTR("Teeth")))
      {
        v6 = avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality;
      }
      else
      {
        v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("tongue"));
        v6 = avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality;
        if ((avt_enableSubdivisionOnHierarchyWithQuality_animoji__forceHighQuality & 1) == 0 && (v7 & 1) == 0)
          v6 = *(_QWORD *)(a1 + 32);
      }
      if (!*(_BYTE *)(a1 + 40)
        && ((objc_msgSend(v5, "containsString:", CFSTR("headwear_crown")) & 1) != 0
         || objc_msgSend(v5, "containsString:", CFSTR("headwear_jewels"))))
      {
        v6 = 2;
      }
      objc_msgSend(v3, "tessellator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "tessellator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0CD5990]);

        objc_msgSend(v3, "setTessellator:", v10);
        objc_msgSend(v3, "setWantsAdaptiveSubdivision:", 1);
        v8 = v10;
      }
      if (v6 <= 2)
      {
        v11 = dbl_1DD26A778[v6];
        objc_msgSend(v3, "setSubdivisionLevel:", qword_1DD26A760[v6]);
        objc_msgSend(v8, "setTessellationFactorScale:", v11);
      }

    }
  }

}

void __75__SCNNode_AVTExtension__avt_setGeometryPrimitiveRangesFromFaceIndexRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6 >> 1);
  if (v6 >= 2)
  {
    if (v6 >> 1 <= 1)
      v8 = 1;
    else
      v8 = v6 >> 1;
    v9 = 1;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "unsignedIntegerValue");

      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v14);

      v9 += 2;
      --v8;
    }
    while (v8);
  }
  objc_msgSend(v15, "setPrimitiveRanges:", v7);

}

@end
