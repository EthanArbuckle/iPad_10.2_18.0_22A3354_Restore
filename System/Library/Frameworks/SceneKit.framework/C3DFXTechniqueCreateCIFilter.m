@implementation C3DFXTechniqueCreateCIFilter

uint64_t __C3DFXTechniqueCreateCIFilter_block_invoke(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)a1[4];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        a2 = (void *)objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "stringByAppendingString:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1[8]), "stringValue")));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("SceneKit-CI-nodetree-color"), a1[5]), "stringByReplacingOccurrencesOfString:withString:", CFSTR("SceneKit-CI-effect-color"), a1[6]), "stringByReplacingOccurrencesOfString:withString:", CFSTR("SceneKit_renderCINodeTree"), a1[7]);
}

@end
