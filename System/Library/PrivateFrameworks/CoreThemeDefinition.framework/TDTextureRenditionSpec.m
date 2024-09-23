@implementation TDTextureRenditionSpec

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend((id)-[TDTextureRenditionSpec pixelFormat](self, "pixelFormat", a3, a4, a5), "identifier");
  v7 = (void *)-[TDTextureRenditionSpec mipLevels](self, "mipLevels");
  v8 = (void *)objc_msgSend(v7, "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(face = nil) OR (face.identifier = 0)")));
  v26[0] = objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("level"), 1);
  v9 = (id)objc_msgSend(v8, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1));
  v10 = (void *)objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v11 = (double)(int)objc_msgSend((id)objc_msgSend(v10, "textureImage"), "width");
  v12 = (double)(int)objc_msgSend((id)objc_msgSend(v10, "textureImage"), "height");
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithTextureForPixelFormat:", v6);
  objc_msgSend(v13, "setSize:", v11, v12);
  objc_msgSend(v13, "setName:", objc_msgSend((id)objc_msgSend((id)-[TDTextureRenditionSpec production](self, "production"), "name"), "name"));
  objc_msgSend(v13, "setTextureFormat:", v6);
  objc_msgSend(v13, "setCubemap:", -[TDTextureRenditionSpec cubeMap](self, "cubeMap"));
  objc_msgSend(v13, "setPixelFormat:", 1095911234);
  objc_msgSend(v13, "setColorSpaceID:", 1);
  objc_msgSend(v13, "setTextureInterpretation:", objc_msgSend((id)objc_msgSend((id)-[TDTextureRenditionSpec production](self, "production"), "textureInterpretation"), "identifier"));
  objc_msgSend(v13, "setTextureOpaque:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "lastObject"), "textureImage"), "opaque"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v9);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C68]), "initWithKeyList:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "textureImage"), "keySpec"), "key"));
        objc_msgSend(v13, "addMipReference:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }
  objc_msgSend(v13, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  v19 = (void *)objc_msgSend(v13, "CSIRepresentationWithCompression:", 1);

  return v19;
}

@end
