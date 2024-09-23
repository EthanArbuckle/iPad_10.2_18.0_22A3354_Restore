@implementation SCNNode(AVTExtension)

- (void)avt_enableSubdivisionOnHierarchyWithQuality:()AVTExtension animoji:
{
  _QWORD v7[5];
  char v8;

  if (avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceToken != -1)
    dispatch_once(&avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceToken, &__block_literal_global_21);
  if (avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceTokenPad != -1)
    dispatch_once(&avt_enableSubdivisionOnHierarchyWithQuality_animoji__onceTokenPad, &__block_literal_global_51);
  if (!avt_enableSubdivisionOnHierarchyWithQuality_animoji__disableSubdivision)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__SCNNode_AVTExtension__avt_enableSubdivisionOnHierarchyWithQuality_animoji___block_invoke_3;
    v7[3] = &__block_descriptor_41_e21_v24__0__SCNNode_8_B16l;
    v8 = a4;
    v7[4] = a3;
    objc_msgSend(a1, "enumerateHierarchyUsingBlock:", v7);
  }
}

- (void)avt_setGeometryPrimitiveRangesFromFaceIndexRanges:()AVTExtension
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "count"))
          {

            objc_msgSend(a1, "geometry");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "geometryElements");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __75__SCNNode_AVTExtension__avt_setGeometryPrimitiveRangesFromFaceIndexRanges___block_invoke;
            v13[3] = &unk_1EA61FC10;
            v14 = v6;
            objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(a1, "setGeometry:", 0);
  }
LABEL_12:

}

@end
