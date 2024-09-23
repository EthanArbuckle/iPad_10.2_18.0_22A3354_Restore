@implementation GESSIOPolyMeshCreator

- (BOOL)setPositionData:(id)a3
{
  objc_storeStrong((id *)&self->_positionData, a3);
  return 1;
}

- (BOOL)setFaceData:(id)a3
{
  objc_storeStrong((id *)&self->_faceData, a3);
  return 1;
}

- (BOOL)setVertexNormalData:(id)a3
{
  objc_storeStrong((id *)&self->_vertexNormalData, a3);
  return 1;
}

- (BOOL)setVertexNormalFaceData:(id)a3
{
  objc_storeStrong((id *)&self->_vertexNormalFaceData, a3);
  return 1;
}

- (BOOL)setVertexColorData:(id)a3
{
  objc_storeStrong((id *)&self->_vertexColorData, a3);
  return 1;
}

- (BOOL)setTexCoordData:(id)a3
{
  objc_storeStrong((id *)&self->_texCoordData, a3);
  return 1;
}

- (BOOL)setTexCoordFaceData:(id)a3
{
  objc_storeStrong((id *)&self->_texCoordFaceData, a3);
  return 1;
}

- (BOOL)setFaceGroupIDData:(id)a3
{
  objc_storeStrong((id *)&self->_faceGroupIDData, a3);
  return 1;
}

- (BOOL)setGroupNames:(id)a3
{
  objc_storeStrong((id *)&self->_groupNameArray, a3);
  return 1;
}

- (BOOL)setGroupIDToMaterialNameDict:(id)a3
{
  objc_storeStrong((id *)&self->_groupIDToMaterialNameDict, a3);
  return 1;
}

- (BOOL)setMtlFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_mtlFilePath, a3);
  return 1;
}

- (BOOL)create:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSUInteger v6;
  _BOOL4 v7;
  NSUInteger v8;
  NSUInteger v9;
  _BOOL4 v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _BOOL4 v14;
  NSUInteger v15;
  NSUInteger v16;
  unint64_t v17;
  NSData *faceGroupIDData;
  unint64_t v19;
  unint64_t v20;
  const void *v21;
  std::vector<unsigned int>::size_type v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  NSUInteger v27;
  const void *v28;
  NSUInteger v29;
  const void *v30;
  NSUInteger v31;
  const void *v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  const std::string::value_type *v36;
  NSDictionary *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  id v43;
  const std::string::value_type *v44;
  uint64_t **v45;
  char v46;
  uint64_t v48;
  unsigned int v49;
  uint64_t v51;
  int v52;
  BOOL v53;
  int v54;
  unint64_t *v55;
  unint64_t v56;
  const cv3d::cv::gess::io::LoadObjContents *v57;
  int v58;
  NSUInteger v59;
  void *v60;
  _QWORD v61[2];
  cv3d::cv::gess::io *v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *__dst[2];
  void *v69[2];
  __int128 v70;
  void *v71[2];
  void *v72[2];
  __int128 v73;
  void *v74[2];
  void *v75[2];
  __int128 v76;
  __int128 v77;
  void *v78[2];
  __int128 v79;
  void *v80[2];
  __int128 v81;
  __int128 v82;
  uint64_t *v83;
  _QWORD v84[2];
  std::string v85;
  int v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "meshType") == -1
    || !objc_msgSend(v4, "meshType")
    || !-[NSData length](self->_positionData, "length")
    || !-[NSData length](self->_faceData, "length"))
  {
    goto LABEL_68;
  }
  objc_msgSend(v4, "meshType");
  v5 = __ROR8__(0xAAAAAAAAAAAAAAABLL * -[NSData length](self->_positionData, "length"), 2) <= 0x1555555555555555uLL
    && __ROR8__(0xAAAAAAAAAAAAAAABLL * -[NSData length](self->_faceData, "length"), 2) <= 0x1555555555555555uLL
    && __ROR8__(0xAAAAAAAAAAAAAAABLL * -[NSData length](self->_vertexNormalData, "length"), 2) <= 0x1555555555555555uLL
    && (-[NSData length](self->_texCoordData, "length") & 7) == 0;
  v6 = -[NSData length](self->_vertexColorData, "length");
  if (v6)
    v7 = 0;
  else
    v7 = v5;
  if (v6 && v5)
  {
    v8 = -[NSData length](self->_vertexColorData, "length");
    v7 = v8 == -[NSData length](self->_positionData, "length");
  }
  v9 = -[NSData length](self->_texCoordFaceData, "length");
  if (v9)
    v10 = 0;
  else
    v10 = v7;
  if (v9 && v7)
  {
    v11 = -[NSData length](self->_texCoordFaceData, "length");
    v10 = v11 == -[NSData length](self->_faceData, "length");
  }
  v12 = -[NSData length](self->_vertexNormalFaceData, "length");
  if (!v12 || !v10)
  {
    if (v12)
      v14 = 0;
    else
      v14 = v10;
    if (!v14)
      goto LABEL_68;
  }
  else
  {
    v13 = -[NSData length](self->_vertexNormalFaceData, "length");
    if (v13 != -[NSData length](self->_faceData, "length"))
    {
LABEL_68:
      v46 = 0;
      goto LABEL_69;
    }
  }
  if (objc_msgSend(v4, "meshType") != 1)
  {
    v46 = 1;
    goto LABEL_69;
  }
  v15 = -[NSData length](self->_faceData, "length");
  v16 = -[NSData length](self->_positionData, "length");
  v17 = v15 / 0xC;
  faceGroupIDData = self->_faceGroupIDData;
  if (faceGroupIDData
    && -[NSData length](faceGroupIDData, "length")
    && -[NSData length](self->_faceGroupIDData, "length") != 2 * (v15 / 0xC))
  {
    goto LABEL_68;
  }
  v60 = v4;
  *(_OWORD *)__dst = 0u;
  *(_OWORD *)v69 = 0u;
  v19 = v16 / 0xC;
  v70 = 0u;
  *(_OWORD *)v71 = 0u;
  *(_OWORD *)v72 = 0u;
  v73 = 0u;
  *(_OWORD *)v74 = 0u;
  *(_OWORD *)v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  *(_OWORD *)v78 = 0u;
  v79 = 0u;
  *(_OWORD *)v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = v84;
  v84[0] = 0;
  v84[1] = 0;
  memset(&v85, 0, sizeof(v85));
  v86 = 1;
  v20 = 3 * (v16 / 0xC);
  std::vector<float>::resize((uint64_t)__dst, v20);
  v21 = -[NSData bytes](self->_positionData, "bytes");
  if (3 * (_DWORD)v19)
    memmove(__dst[0], v21, 4 * v20);
  v22 = (3 * v17);
  std::vector<int>::resize((std::vector<unsigned int> *)v71, v22);
  v23 = -[NSData bytes](self->_faceData, "bytes");
  if (3 * (_DWORD)v17)
    memmove(v71[0], v23, 4 * v22);
  v59 = -[NSData length](self->_vertexNormalData, "length", v19) / 0xC;
  if (-[NSData length](self->_vertexNormalData, "length"))
  {
    std::vector<float>::resize((uint64_t)&v78[1], (3 * v59));
    v24 = -[NSData bytes](self->_vertexNormalData, "bytes");
    if (3 * (_DWORD)v59)
      memmove(v78[1], v24, 4 * (3 * v59));
  }
  if (-[NSData length](self->_vertexNormalFaceData, "length"))
  {
    std::vector<int>::resize((std::vector<unsigned int> *)v74, v22);
    v25 = -[NSData bytes](self->_vertexNormalFaceData, "bytes");
    if (3 * (_DWORD)v17)
      memmove(v74[0], v25, 4 * v22);
  }
  if (-[NSData length](self->_vertexColorData, "length"))
  {
    std::vector<float>::resize((uint64_t)&v69[1], (3 * v19));
    v26 = -[NSData bytes](self->_vertexColorData, "bytes");
    if (3 * (_DWORD)v19)
      memmove(v69[1], v26, 4 * v20);
  }
  if (-[NSData length](self->_texCoordData, "length"))
  {
    v27 = -[NSData length](self->_texCoordData, "length");
    std::vector<float>::resize((uint64_t)v80, v27 >> 2);
    v28 = -[NSData bytes](self->_texCoordData, "bytes");
    if (v27 >= 4)
      memmove(v80[0], v28, v27 & 0xFFFFFFFFFFFFFFFCLL);
  }
  if (-[NSData length](self->_texCoordFaceData, "length"))
  {
    v29 = -[NSData length](self->_texCoordFaceData, "length");
    std::vector<int>::resize((std::vector<unsigned int> *)&v72[1], v29 >> 2);
    v30 = -[NSData bytes](self->_texCoordFaceData, "bytes");
    if (v29 >= 4)
      memmove(v72[1], v30, v29 & 0xFFFFFFFFFFFFFFFCLL);
  }
  if (-[NSData length](self->_faceGroupIDData, "length"))
  {
    v31 = -[NSData length](self->_faceGroupIDData, "length");
    std::vector<unsigned short>::resize((uint64_t)&v75[1], v31 >> 1);
    v32 = -[NSData bytes](self->_faceGroupIDData, "bytes");
    if (v31 >= 2)
      memmove(v75[1], v32, v31 & 0xFFFFFFFFFFFFFFFELL);
  }
  if (-[NSArray count](self->_groupNameArray, "count"))
  {
    std::vector<std::string>::resize((std::vector<std::string> *)((char *)&v81 + 8), -[NSArray count](self->_groupNameArray, "count"));
    if (-1431655765 * (((_QWORD)v82 - *((_QWORD *)&v81 + 1)) >> 3))
    {
      v33 = 0;
      v34 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](self->_groupNameArray, "objectAtIndexedSubscript:", v34);
        v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v36 = (const std::string::value_type *)objc_msgSend(v35, "UTF8String");
        std::string::__assign_external((std::string *)(*((_QWORD *)&v81 + 1) + v33), v36);

        ++v34;
        v33 += 24;
      }
      while (v34 < -1431655765 * (((_QWORD)v82 - *((_QWORD *)&v81 + 1)) >> 3));
    }
  }
  if (-[NSDictionary count](self->_groupIDToMaterialNameDict, "count"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v37 = self->_groupIDToMaterialNameDict;
    v38 = -[NSDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
    if (v38)
    {
      v39 = 0;
      v40 = *(_QWORD *)v65;
      for (i = *(_QWORD *)v65; ; i = *(_QWORD *)v65)
      {
        if (i != v40)
          objc_enumerationMutation(v37);
        v42 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v39);
        LOWORD(v61[0]) = 0;
        LOWORD(v61[0]) = objc_msgSend(v42, "unsignedShortValue");
        -[NSDictionary objectForKeyedSubscript:](self->_groupIDToMaterialNameDict, "objectForKeyedSubscript:", v42);
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v44 = (const std::string::value_type *)objc_msgSend(v43, "UTF8String");

        v62 = (cv3d::cv::gess::io *)v61;
        v45 = std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,std::string>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short &&>,std::tuple<>>(&v83, (unsigned __int16 *)v61, (uint64_t)&std::piecewise_construct, (_WORD **)&v62);
        std::string::__assign_external((std::string *)(v45 + 5), v44);
        if (++v39 >= v38)
        {
          v38 = -[NSDictionary countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v64, v87, 16);
          if (!v38)
            break;
          v39 = 0;
        }
      }
    }

  }
  if (-[NSString length](self->_mtlFilePath, "length"))
    std::string::__assign_external(&v85, -[NSString UTF8String](self->_mtlFilePath, "UTF8String"));
  v4 = v60;
  if (v78[1] != (void *)v79)
  {
    if (v74[0] == v74[1])
    {
      if ((_DWORD)v59 == v58)
LABEL_82:
        LODWORD(v51) = 1;
      else
        LODWORD(v51) = 2 * ((_DWORD)v59 == (_DWORD)v17);
    }
    else
    {
      v48 = 0;
      v49 = 1;
      while (*((_DWORD *)v71[0] + v48) == *((_DWORD *)v74[0] + v48))
      {
        v48 = v49;
        if (((char *)v74[1] - (char *)v74[0]) >> 2 <= (unint64_t)v49++)
          goto LABEL_82;
      }
      if ((_DWORD)v17)
      {
        v52 = 0;
        while (1)
        {
          v51 = 0;
          v53 = 1;
          do
          {
            while (!v53)
            {
              v53 = 0;
              if (++v51 == 3)
                goto LABEL_96;
            }
            v54 = *((_DWORD *)v74[0] + (3 * v52 + v51));
            v53 = v52 == v54;
            ++v51;
          }
          while (v51 != 3);
          if (v52 != v54)
            break;
          ++v52;
          LODWORD(v51) = 2;
          if (v52 == (_DWORD)v17)
            goto LABEL_96;
        }
        LODWORD(v51) = 3;
      }
      else
      {
        LODWORD(v51) = 2;
      }
    }
LABEL_96:
    v86 = v51;
  }
  _ZNSt3__115allocate_sharedB8ne180100IN4cv3d2cv4gess4mesh7TriMeshENS_9allocatorIS5_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v62);
  v61[0] = v62;
  v61[1] = v63;
  if (v63)
  {
    v55 = (unint64_t *)(v63 + 8);
    do
      v56 = __ldxr(v55);
    while (__stxr(v56 + 1, v55));
  }
  objc_msgSend(v60, "setMeshImpl:", v61);
  std::shared_ptr<cv3d::cv::gess::mesh::BaseAttribute>::~shared_ptr[abi:ne180100]((uint64_t)v61);
  v46 = cv3d::cv::gess::io::MeshFromObjContents((uint64_t **)v62, (std::string *)__dst, v57);
  std::shared_ptr<cv3d::cv::gess::mesh::BaseAttribute>::~shared_ptr[abi:ne180100]((uint64_t)&v62);
  cv3d::cv::gess::io::LoadObjContents::~LoadObjContents((cv3d::cv::gess::io::LoadObjContents *)__dst);
LABEL_69:

  return v46;
}

- (BOOL)clear
{
  NSData *positionData;
  NSData *faceData;
  NSData *vertexNormalData;
  NSData *vertexNormalFaceData;
  NSData *vertexColorData;
  NSData *texCoordData;
  NSData *texCoordFaceData;
  NSData *faceGroupIDData;
  NSArray *groupNameArray;
  NSDictionary *groupIDToMaterialNameDict;
  NSString *mtlFilePath;

  positionData = self->_positionData;
  self->_positionData = 0;

  faceData = self->_faceData;
  self->_faceData = 0;

  vertexNormalData = self->_vertexNormalData;
  self->_vertexNormalData = 0;

  vertexNormalFaceData = self->_vertexNormalFaceData;
  self->_vertexNormalFaceData = 0;

  vertexColorData = self->_vertexColorData;
  self->_vertexColorData = 0;

  texCoordData = self->_texCoordData;
  self->_texCoordData = 0;

  texCoordFaceData = self->_texCoordFaceData;
  self->_texCoordFaceData = 0;

  faceGroupIDData = self->_faceGroupIDData;
  self->_faceGroupIDData = 0;

  groupNameArray = self->_groupNameArray;
  self->_groupNameArray = 0;

  groupIDToMaterialNameDict = self->_groupIDToMaterialNameDict;
  self->_groupIDToMaterialNameDict = 0;

  mtlFilePath = self->_mtlFilePath;
  self->_mtlFilePath = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlFilePath, 0);
  objc_storeStrong((id *)&self->_groupIDToMaterialNameDict, 0);
  objc_storeStrong((id *)&self->_groupNameArray, 0);
  objc_storeStrong((id *)&self->_faceGroupIDData, 0);
  objc_storeStrong((id *)&self->_texCoordFaceData, 0);
  objc_storeStrong((id *)&self->_texCoordData, 0);
  objc_storeStrong((id *)&self->_vertexColorData, 0);
  objc_storeStrong((id *)&self->_vertexNormalFaceData, 0);
  objc_storeStrong((id *)&self->_vertexNormalData, 0);
  objc_storeStrong((id *)&self->_faceData, 0);
  objc_storeStrong((id *)&self->_positionData, 0);
}

@end
