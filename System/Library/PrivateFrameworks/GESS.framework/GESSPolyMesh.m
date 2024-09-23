@implementation GESSPolyMesh

- (GESSPolyMesh)init
{
  GESSPolyMesh *v2;
  GESSPolyMesh *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GESSPolyMesh;
  v2 = -[GESSPolyMesh init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GESSPolyMesh setMeshType:](v2, "setMeshType:", 0xFFFFFFFFLL);
  return v3;
}

- (int)meshType
{
  return self->_meshType;
}

- (void)setMeshType:(int)a3
{
  self->_meshType = a3;
}

- (void)meshImpl
{
  return self->_meshImpl.__ptr_;
}

- (void)setMeshImpl:(const void *)a3
{
  std::shared_ptr<cv3d::cv::gess::util::Imagef>::operator=[abi:ne180100](&self->_meshImpl.__ptr_, (uint64_t *)a3);
}

- (void)materialImpl
{
  return self->_materialImpl.__ptr_;
}

- (void)setMaterialImpl:(const void *)a3
{
  std::shared_ptr<cv3d::cv::gess::util::Imagef>::operator=[abi:ne180100](&self->_materialImpl.__ptr_, (uint64_t *)a3);
}

- (BOOL)valid
{
  void *v3;

  v3 = -[GESSPolyMesh meshImpl](self, "meshImpl");
  if (v3)
    LOBYTE(v3) = -[GESSPolyMesh meshType](self, "meshType") != -1 && -[GESSPolyMesh meshType](self, "meshType") != 0;
  return (char)v3;
}

- (unsigned)vertexSize
{
  uint64_t v3;
  _QWORD *v4;

  LODWORD(v3) = -[GESSPolyMesh valid](self, "valid");
  if ((_DWORD)v3)
  {
    if (-[GESSPolyMesh meshType](self, "meshType") == 1)
    {
      v4 = -[GESSPolyMesh meshImpl](self, "meshImpl");
      return (v4[14] - v4[13]) >> 2;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (unsigned)halfEdgeSize
{
  unsigned int result;
  _QWORD *v4;

  result = -[GESSPolyMesh valid](self, "valid");
  if (result)
  {
    if (-[GESSPolyMesh meshType](self, "meshType") == 1)
    {
      v4 = -[GESSPolyMesh meshImpl](self, "meshImpl");
      return -858993459 * ((v4[17] - v4[16]) >> 2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)faceSize
{
  uint64_t v3;
  _QWORD *v4;

  LODWORD(v3) = -[GESSPolyMesh valid](self, "valid");
  if ((_DWORD)v3)
  {
    if (-[GESSPolyMesh meshType](self, "meshType") == 1)
    {
      v4 = -[GESSPolyMesh meshImpl](self, "meshImpl");
      return (v4[20] - v4[19]) >> 2;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (unsigned)texCoordSize
{
  unsigned int result;
  uint64_t **v4;
  uint64_t **v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *__p[2];
  char v10;
  uint64_t v11;

  result = -[GESSPolyMesh valid](self, "valid");
  if (result)
  {
    if (-[GESSPolyMesh meshType](self, "meshType") != 1)
      return 0;
    v4 = -[GESSPolyMesh meshImpl](self, "meshImpl");
    std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_UVS[0]);
    v5 = v4 + 10;
    v11 = 0;
    v7 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector2T<float>>(v5, (uint64_t)&v11, (unsigned __int8 *)__p);
    if (v10 < 0)
      operator delete(__p[0]);
    if (v7 == -1)
    {
      return 0;
    }
    else
    {
      LODWORD(__p[0]) = v7;
      v8 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector2T<float>>((uint64_t *)v5, (unsigned int *)__p, v6);
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
    }
  }
  return result;
}

- (unsigned)vertexNormalSize
{
  unsigned int result;
  uint64_t **v4;
  uint64_t *v5;
  int v6;
  uint64_t v7;
  void *__p[2];
  char v9;
  int v10;
  _QWORD v11[2];

  result = -[GESSPolyMesh valid](self, "valid");
  if (result)
  {
    if (-[GESSPolyMesh meshType](self, "meshType") == 1)
    {
      v4 = -[GESSPolyMesh meshImpl](self, "meshImpl");
      v10 = 0;
      cv3d::cv::gess::io::ProvideAutoSavingNormalType(v4, &v10);
      if (v10 == 3)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_NORMAL[0]);
        v5 = (uint64_t *)(v4 + 10);
        v11[0] = 0;
        v11[1] = 0;
        v6 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v4 + 10, (uint64_t)v11, (unsigned __int8 *)__p);
        if (v9 < 0)
          operator delete(__p[0]);
        LODWORD(__p[0]) = v6;
        v7 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>(v5, (unsigned int *)__p);
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
      }
      else if (v10 == 2)
      {
        return -[GESSPolyMesh faceSize](self, "faceSize");
      }
      else
      {
        result = 0;
        if (v10 == 1)
          return -[GESSPolyMesh vertexSize](self, "vertexSize");
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)getPositionData:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  int v13;
  BOOL v14;
  unsigned int v16;

  v4 = a3;
  if (-[GESSPolyMesh valid](self, "valid")
    && -[GESSPolyMesh meshType](self, "meshType") == 1
    && (v5 = -[GESSPolyMesh vertexSize](self, "vertexSize"), objc_msgSend(v4, "length") == 12 * v5))
  {
    v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v7 = -[GESSPolyMesh meshImpl](self, "meshImpl");
    v16 = *((_DWORD *)v7 + 44);
    v8 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v7 + 1, &v16);
    if (v5)
    {
      v9 = 0;
      v10 = *(_QWORD *)(v8 + 40);
      v11 = (*(_QWORD *)(v8 + 48) - v10) >> 4;
      v12 = (int *)(v10 + 8);
      do
      {
        if (!v11)
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        *(_DWORD *)(v6 + 4 * v9) = *(v12 - 2);
        *(_DWORD *)(v6 + 4 * (v9 + 1)) = *(v12 - 1);
        v13 = *v12;
        v12 += 4;
        *(_DWORD *)(v6 + 4 * (v9 + 2)) = v13;
        --v11;
        v9 += 3;
      }
      while (3 * v5 != v9);
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)getFaceData:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  _DWORD *v10;
  BOOL v11;
  unsigned int v13;
  void *__p[3];

  v4 = a3;
  if (-[GESSPolyMesh valid](self, "valid") && -[GESSPolyMesh meshType](self, "meshType") == 1)
  {
    v5 = -[GESSPolyMesh faceSize](self, "faceSize");
    if (objc_msgSend(v4, "length") == 12 * v5)
    {
      v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
      std::vector<cv3d::cv::gess::mesh::VertexHandle>::vector(__p, 3uLL);
      if (v5)
      {
        v7 = 0;
        v8 = 2;
        do
        {
          v9 = -[GESSPolyMesh meshImpl](self, "meshImpl");
          v13 = v7;
          cv3d::cv::gess::mesh::TriMesh::GetFaceVertices((uint64_t)v9, &v13, __p);
          v10 = __p[0];
          *(_DWORD *)(v6 + 4 * (v8 - 2)) = *(_DWORD *)__p[0];
          *(_DWORD *)(v6 + 4 * (v8 - 1)) = v10[1];
          *(_DWORD *)(v6 + 4 * v8) = v10[2];
          ++v7;
          v8 += 3;
        }
        while (v5 != v7);
      }
      else
      {
        v10 = __p[0];
        if (!__p[0])
        {
LABEL_12:
          v11 = 1;
          goto LABEL_9;
        }
      }
      __p[1] = v10;
      operator delete(v10);
      goto LABEL_12;
    }
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)getTexCoordData:(id)a3
{
  id v4;
  uint64_t **v5;
  uint64_t **v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  BOOL v20;
  void *__p[2];
  char v23;
  uint64_t v24;

  v4 = a3;
  if (!-[GESSPolyMesh valid](self, "valid") || -[GESSPolyMesh meshType](self, "meshType") != 1)
    goto LABEL_12;
  v5 = -[GESSPolyMesh meshImpl](self, "meshImpl");
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_UVS[0]);
  v6 = v5 + 10;
  v24 = 0;
  v8 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector2T<float>>(v6, (uint64_t)&v24, (unsigned __int8 *)__p);
  if (v23 < 0)
    operator delete(__p[0]);
  if (v8 != -1
    && (LODWORD(__p[0]) = v8,
        v9 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector2T<float>>((uint64_t *)v6, (unsigned int *)__p, v7), v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9), objc_msgSend(v4, "length") == 8 * (v10 & 0x7FFFFFFF)))
  {
    v11 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (v10)
    {
      v13 = v11;
      v14 = 0;
      v15 = 1;
      v16 = 4;
      do
      {
        LODWORD(__p[0]) = v8;
        v17 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector2T<float>>((uint64_t *)v6, (unsigned int *)__p, v12);
        v18 = *(_QWORD *)(v17 + 40);
        if (v14 >= (*(_QWORD *)(v17 + 48) - v18) >> 3)
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        v19 = (_DWORD *)(v18 + v16);
        *(_DWORD *)(v13 + 4 * (v15 - 1)) = *(v19 - 1);
        *(_DWORD *)(v13 + 4 * v15) = *v19;
        ++v14;
        v16 += 8;
        v15 += 2;
      }
      while (v10 != v14);
    }
    v20 = 1;
  }
  else
  {
LABEL_12:
    v20 = 0;
  }

  return v20;
}

- (BOOL)getTexCoordFaceData:(id)a3
{
  id v4;
  uint64_t **v5;
  uint64_t **v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  BOOL v18;
  void *__p[2];
  char v21;
  uint64_t v22;
  int v23;

  v4 = a3;
  if (!-[GESSPolyMesh valid](self, "valid") || -[GESSPolyMesh meshType](self, "meshType") != 1)
    goto LABEL_12;
  v5 = -[GESSPolyMesh meshImpl](self, "meshImpl");
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::FACE_UV_ID[0]);
  v6 = v5 + 7;
  v23 = 0;
  v22 = 0;
  v7 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<unsigned int>>(v6, (uint64_t)&v22, (unsigned __int8 *)__p);
  if (v21 < 0)
    operator delete(__p[0]);
  if (v7 != -1 && (v8 = -[GESSPolyMesh faceSize](self, "faceSize"), objc_msgSend(v4, "length") == 12 * v8))
  {
    v9 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (v8)
    {
      v11 = v9;
      v12 = 0;
      v13 = 2;
      v14 = 4;
      do
      {
        LODWORD(__p[0]) = v7;
        v15 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v6, (unsigned int *)__p, v10);
        v16 = *(_QWORD *)(v15 + 40);
        if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v15 + 48) - v16) >> 2) <= v12)
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        v17 = (_DWORD *)(v16 + v14);
        *(_DWORD *)(v11 + 4 * (v13 - 2)) = *(v17 - 1);
        *(_DWORD *)(v11 + 4 * (v13 - 1)) = *v17;
        *(_DWORD *)(v11 + 4 * v13) = v17[1];
        ++v12;
        v13 += 3;
        v14 += 12;
      }
      while (v8 != v12);
    }
    v18 = 1;
  }
  else
  {
LABEL_12:
    v18 = 0;
  }

  return v18;
}

- (BOOL)getVertexNormalData:(id)a3
{
  id v4;
  uint64_t **v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t **v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t **v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t **v34;
  int v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  void *__p[2];
  char v51;
  int v52;
  uint64_t v53;
  uint64_t v54;

  v4 = a3;
  if (!-[GESSPolyMesh valid](self, "valid") || -[GESSPolyMesh meshType](self, "meshType") != 1)
    goto LABEL_36;
  v5 = -[GESSPolyMesh meshImpl](self, "meshImpl");
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  v52 = 0;
  cv3d::cv::gess::io::ProvideAutoSavingNormalType(v5, &v52);
  if (v52 == 3)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_NORMAL[0]);
    v34 = v5 + 7;
    v53 = 0;
    v54 = 0;
    v35 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v34, (uint64_t)&v53, (unsigned __int8 *)__p);
    if (v51 < 0)
      operator delete(__p[0]);
    LODWORD(__p[0]) = v35;
    v36 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p);
    v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v36 + 16))(v36);
    if (objc_msgSend(v6, "length") == 12 * v37)
    {
      v38 = v37;
      if (v37)
      {
        v39 = 0;
        v40 = 2;
        v41 = 4;
        do
        {
          LODWORD(__p[0]) = v35;
          v42 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p);
          v43 = *(_QWORD *)(v42 + 40);
          if (v39 >= (*(_QWORD *)(v42 + 48) - v43) >> 4)
            goto LABEL_40;
          *(_DWORD *)(v7 + 4 * (v40 - 2)) = *(_DWORD *)(v43 + v41 - 4);
          LODWORD(__p[0]) = v35;
          v44 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p);
          v45 = *(_QWORD *)(v44 + 40);
          if (v39 >= (*(_QWORD *)(v44 + 48) - v45) >> 4
            || (*(_DWORD *)(v7 + 4 * (v40 - 1)) = *(_DWORD *)(v45 + v41),
                LODWORD(__p[0]) = v35,
                v46 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p), v47 = *(_QWORD *)(v46 + 40), v39 >= (*(_QWORD *)(v46 + 48) - v47) >> 4))
          {
LABEL_40:
            __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
          }
          *(_DWORD *)(v7 + 4 * v40) = *(_DWORD *)(v47 + v41 + 4);
          ++v39;
          v40 += 3;
          v41 += 16;
        }
        while (v38 != v39);
      }
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v52 == 2)
  {
    v21 = (char *)v5[20] - (char *)v5[19];
    if (objc_msgSend(v6, "length") == 12 * (v21 >> 2))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::FACE_NORMAL[0]);
      v22 = v5 + 7;
      v53 = 0;
      v54 = 0;
      v23 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v22, (uint64_t)&v53, (unsigned __int8 *)__p);
      if (v51 < 0)
        operator delete(__p[0]);
      if ((v21 & 0x3FFFFFFFCLL) != 0)
      {
        v24 = 0;
        v25 = 0;
        v26 = ((unint64_t)v21 >> 2);
        v27 = 2;
        do
        {
          LODWORD(__p[0]) = v23;
          v28 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v22, (unsigned int *)__p);
          v29 = *(_QWORD *)(v28 + 40);
          if (v25 >= (*(_QWORD *)(v28 + 48) - v29) >> 4)
            goto LABEL_38;
          *(_DWORD *)(v7 + 4 * (v27 - 2)) = *(_DWORD *)(v29 + v24);
          LODWORD(__p[0]) = v23;
          v30 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v22, (unsigned int *)__p);
          v31 = *(_QWORD *)(v30 + 40);
          if (v25 >= (*(_QWORD *)(v30 + 48) - v31) >> 4
            || (*(_DWORD *)(v7 + 4 * (v27 - 1)) = *(_DWORD *)(v31 + v24 + 4),
                LODWORD(__p[0]) = v23,
                v32 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v22, (unsigned int *)__p), v33 = *(_QWORD *)(v32 + 40), v25 >= (*(_QWORD *)(v32 + 48) - v33) >> 4))
          {
LABEL_38:
            __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
          }
          *(_DWORD *)(v7 + 4 * v27) = *(_DWORD *)(v33 + v24 + 8);
          ++v25;
          v27 += 3;
          v24 += 16;
        }
        while (v26 != v25);
      }
      goto LABEL_35;
    }
LABEL_36:
    v48 = 0;
    goto LABEL_37;
  }
  if (v52 != 1)
    goto LABEL_36;
  v8 = (char *)v5[14] - (char *)v5[13];
  if (objc_msgSend(v6, "length") != 12 * (v8 >> 2))
    goto LABEL_36;
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::VERTEX_NORMAL[0]);
  v9 = v5 + 1;
  v53 = 0;
  v54 = 0;
  v10 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v9, (uint64_t)&v53, (unsigned __int8 *)__p);
  if (v51 < 0)
    operator delete(__p[0]);
  if ((v8 & 0x3FFFFFFFCLL) != 0)
  {
    v11 = 0;
    v12 = 0;
    v13 = ((unint64_t)v8 >> 2);
    v14 = 2;
    do
    {
      LODWORD(__p[0]) = v10;
      v15 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v9, (unsigned int *)__p);
      v16 = *(_QWORD *)(v15 + 40);
      if (v12 >= (*(_QWORD *)(v15 + 48) - v16) >> 4)
        goto LABEL_39;
      *(_DWORD *)(v7 + 4 * (v14 - 2)) = *(_DWORD *)(v16 + v11);
      LODWORD(__p[0]) = v10;
      v17 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v9, (unsigned int *)__p);
      v18 = *(_QWORD *)(v17 + 40);
      if (v12 >= (*(_QWORD *)(v17 + 48) - v18) >> 4
        || (*(_DWORD *)(v7 + 4 * (v14 - 1)) = *(_DWORD *)(v18 + v11 + 4),
            LODWORD(__p[0]) = v10,
            v19 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v9, (unsigned int *)__p), v20 = *(_QWORD *)(v19 + 40), v12 >= (*(_QWORD *)(v19 + 48) - v20) >> 4))
      {
LABEL_39:
        __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
      }
      *(_DWORD *)(v7 + 4 * v14) = *(_DWORD *)(v20 + v11 + 8);
      ++v12;
      v14 += 3;
      v11 += 16;
    }
    while (v13 != v12);
  }
LABEL_35:
  v48 = 1;
LABEL_37:

  return v48;
}

- (BOOL)getVertexNormalFaceData:(id)a3
{
  id v4;
  uint64_t **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  uint64_t **v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  _DWORD *v31;
  void *__p[2];
  char v34;
  int v35;
  uint64_t v36;
  int v37;

  v4 = a3;
  if (-[GESSPolyMesh valid](self, "valid") && -[GESSPolyMesh meshType](self, "meshType") == 1)
  {
    v5 = -[GESSPolyMesh meshImpl](self, "meshImpl");
    v6 = (char *)v5[20] - (char *)v5[19];
    v7 = v6 >> 2;
    if (objc_msgSend(v4, "length") != 12 * (v6 >> 2))
      goto LABEL_12;
    v8 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v35 = 0;
    cv3d::cv::gess::io::ProvideAutoSavingNormalType(v5, &v35);
    if (v35 != 1)
    {
      if (v35 == 3)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::FACE_NORMAL_ID[0]);
        v13 = v5 + 7;
        v37 = 0;
        v36 = 0;
        v15 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<unsigned int>>(v13, (uint64_t)&v36, (unsigned __int8 *)__p);
        if (v34 < 0)
          operator delete(__p[0]);
        if ((_DWORD)v7)
        {
          v16 = 0;
          v17 = ((unint64_t)v6 >> 2);
          v18 = 2;
          v19 = 4;
          do
          {
            LODWORD(__p[0]) = v15;
            v20 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v13, (unsigned int *)__p, v14);
            v22 = *(_QWORD *)(v20 + 40);
            if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v20 + 48) - v22) >> 2) <= v16)
              goto LABEL_31;
            *(_DWORD *)(v8 + 4 * (v18 - 2)) = *(_DWORD *)(v22 + v19 - 4);
            LODWORD(__p[0]) = v15;
            v23 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v13, (unsigned int *)__p, v21);
            v25 = *(_QWORD *)(v23 + 40);
            if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v23 + 48) - v25) >> 2) <= v16
              || (*(_DWORD *)(v8 + 4 * (v18 - 1)) = *(_DWORD *)(v25 + v19),
                  LODWORD(__p[0]) = v15,
                  v26 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v13, (unsigned int *)__p, v24), v27 = *(_QWORD *)(v26 + 40), 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(v26 + 48) - v27) >> 2) <= v16))
            {
LABEL_31:
              __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
            }
            *(_DWORD *)(v8 + 4 * v18) = *(_DWORD *)(v27 + v19 + 4);
            ++v16;
            v18 += 3;
            v19 += 12;
          }
          while (v17 != v16);
        }
        goto LABEL_28;
      }
      if (v35 == 2)
      {
        if ((_DWORD)v7)
        {
          v9 = 0;
          v10 = 2;
          do
          {
            *(_DWORD *)(v8 + 4 * (v10 - 2)) = v9;
            *(_DWORD *)(v8 + 4 * (v10 - 1)) = v9;
            *(_DWORD *)(v8 + 4 * v10) = v9++;
            v10 += 3;
          }
          while (((unint64_t)v6 >> 2) != v9);
        }
        goto LABEL_28;
      }
LABEL_12:
      v12 = 1;
LABEL_29:
      v11 = v12 == 0;
      goto LABEL_30;
    }
    std::vector<cv3d::cv::gess::mesh::VertexHandle>::vector(__p, 3uLL);
    if ((_DWORD)v7)
    {
      v28 = 0;
      v29 = ((unint64_t)v6 >> 2);
      v30 = 2;
      do
      {
        LODWORD(v36) = v28;
        cv3d::cv::gess::mesh::TriMesh::GetFaceVertices((uint64_t)v5, (unsigned int *)&v36, __p);
        v31 = __p[0];
        *(_DWORD *)(v8 + 4 * (v30 - 2)) = *(_DWORD *)__p[0];
        *(_DWORD *)(v8 + 4 * (v30 - 1)) = v31[1];
        *(_DWORD *)(v8 + 4 * v30) = v31[2];
        ++v28;
        v30 += 3;
      }
      while (v29 != v28);
    }
    else
    {
      v31 = __p[0];
      if (!__p[0])
      {
LABEL_28:
        v12 = 0;
        goto LABEL_29;
      }
    }
    __p[1] = v31;
    operator delete(v31);
    goto LABEL_28;
  }
  v11 = 0;
LABEL_30:

  return v11;
}

- (BOOL)getVertexColorData:(id)a3
{
  id v4;
  uint64_t **v5;
  uint64_t **v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  BOOL v17;
  void *__p[2];
  char v20;
  _QWORD v21[2];

  v4 = a3;
  if (!-[GESSPolyMesh valid](self, "valid") || -[GESSPolyMesh meshType](self, "meshType") != 1)
    goto LABEL_12;
  v5 = -[GESSPolyMesh meshImpl](self, "meshImpl");
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::VERTEX_COLOR[0]);
  v6 = v5 + 1;
  v21[0] = 0;
  v21[1] = 0;
  v7 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v6, (uint64_t)v21, (unsigned __int8 *)__p);
  if (v20 < 0)
    operator delete(__p[0]);
  if (v7 != -1 && (v8 = -[GESSPolyMesh vertexSize](self, "vertexSize"), objc_msgSend(v4, "length") == 12 * v8))
  {
    v9 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
    if (v8)
    {
      v10 = v9;
      v11 = 0;
      v12 = 2;
      v13 = 4;
      do
      {
        LODWORD(__p[0]) = v7;
        v14 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v6, (unsigned int *)__p);
        v15 = *(_QWORD *)(v14 + 40);
        if (v11 >= (*(_QWORD *)(v14 + 48) - v15) >> 4)
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        v16 = (_DWORD *)(v15 + v13);
        *(_DWORD *)(v10 + 4 * (v12 - 2)) = *(v16 - 1);
        *(_DWORD *)(v10 + 4 * (v12 - 1)) = *v16;
        *(_DWORD *)(v10 + 4 * v12) = v16[1];
        ++v11;
        v12 += 3;
        v13 += 16;
      }
      while (v8 != v11);
    }
    v17 = 1;
  }
  else
  {
LABEL_12:
    v17 = 0;
  }

  return v17;
}

- (BOOL)cloneFrom:(id)a3
{
  GESSPolyMesh *v4;
  GESSPolyMesh *v5;
  int v6;
  uint64_t **v7;
  std::string **v8;
  std::string **v9;
  BOOL v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  char *v22;
  std::__shared_weak_count *v23;
  __int128 v24;
  __int128 v25;

  v4 = (GESSPolyMesh *)a3;
  v5 = v4;
  if (self != v4)
  {
    if (-[GESSPolyMesh valid](v4, "valid"))
    {
      v6 = -[GESSPolyMesh meshType](self, "meshType");
      if (v6 == -[GESSPolyMesh meshType](v5, "meshType"))
      {
        if (-[GESSPolyMesh meshImpl](self, "meshImpl"))
        {
LABEL_5:
          cv3d::cv::gess::mesh::PolyMesh::CloneFrom((char **)-[GESSPolyMesh meshImpl](self, "meshImpl"), (void **)-[GESSPolyMesh meshImpl](v5, "meshImpl"));
          if (-[GESSPolyMesh materialImpl](v5, "materialImpl"))
          {
            if (!-[GESSPolyMesh materialImpl](self, "materialImpl"))
            {
              v18 = (char *)operator new(0x60uLL);
              *((_QWORD *)v18 + 1) = 0;
              *((_QWORD *)v18 + 2) = 0;
              *(_QWORD *)v18 = &off_250D4ADF0;
              *(_OWORD *)(v18 + 72) = 0u;
              *(_OWORD *)(v18 + 40) = 0u;
              *(_OWORD *)(v18 + 56) = 0u;
              *((_QWORD *)v18 + 11) = 0;
              *(_OWORD *)(v18 + 24) = 0u;
              *((_QWORD *)v18 + 9) = v18 + 80;
              v22 = v18 + 24;
              v23 = (std::__shared_weak_count *)v18;
              -[GESSPolyMesh setMaterialImpl:](self, "setMaterialImpl:", &v22);
              v19 = v23;
              if (v23)
              {
                p_shared_owners = (unint64_t *)&v23->__shared_owners_;
                do
                  v21 = __ldaxr(p_shared_owners);
                while (__stlxr(v21 - 1, p_shared_owners));
                if (!v21)
                {
                  ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
                  std::__shared_weak_count::__release_weak(v19);
                }
              }
            }
            v7 = -[GESSPolyMesh materialImpl](self, "materialImpl");
            v8 = -[GESSPolyMesh materialImpl](v5, "materialImpl");
            v9 = v8;
            if (v7 != (uint64_t **)v8)
            {
              std::vector<cv3d::cv::gess::mesh::ObjMaterial>::__assign_with_size[abi:ne180100]<cv3d::cv::gess::mesh::ObjMaterial*,cv3d::cv::gess::mesh::ObjMaterial*>((uint64_t)v7, *v8, v8[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v8[1] - (char *)*v8) >> 4));
              std::vector<cv3d::cv::gess::mesh::Texture>::__assign_with_size[abi:ne180100]<cv3d::cv::gess::mesh::Texture*,cv3d::cv::gess::mesh::Texture*>((uint64_t)(v7 + 3), (int *)v9[3], (int *)v9[4], 0xAAAAAAAAAAAAAAABLL * (((char *)v9[4] - (char *)v9[3]) >> 4));
              std::__tree<std::__value_type<std::string,unsigned short>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned short>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned short>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,unsigned short>,std::__tree_node<std::__value_type<std::string,unsigned short>,void *> *,long>>(v7 + 6, v9[6], v9 + 7);
            }
          }
          goto LABEL_9;
        }
        if (-[GESSPolyMesh meshType](self, "meshType") == 1)
        {
          _ZNSt3__115allocate_sharedB8ne180100IN4cv3d2cv4gess4mesh7TriMeshENS_9allocatorIS5_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v24);
          v25 = v24;
          v24 = 0uLL;
          -[GESSPolyMesh setMeshImpl:](self, "setMeshImpl:", &v25);
          v11 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
          if (*((_QWORD *)&v25 + 1))
          {
            v12 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
            do
              v13 = __ldaxr(v12);
            while (__stlxr(v13 - 1, v12));
            if (!v13)
            {
              ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
              std::__shared_weak_count::__release_weak(v11);
            }
          }
          v14 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
          if (*((_QWORD *)&v24 + 1))
          {
            v15 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
            do
              v16 = __ldaxr(v15);
            while (__stlxr(v16 - 1, v15));
            if (!v16)
            {
              ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
              std::__shared_weak_count::__release_weak(v14);
            }
          }
          goto LABEL_5;
        }
      }
    }
    v10 = 0;
    goto LABEL_22;
  }
LABEL_9:
  v10 = 1;
LABEL_22:

  return v10;
}

- (void).cxx_destruct
{
  std::shared_ptr<cv3d::cv::gess::mesh::BaseAttribute>::~shared_ptr[abi:ne180100]((uint64_t)&self->_materialImpl);
  std::shared_ptr<cv3d::cv::gess::mesh::BaseAttribute>::~shared_ptr[abi:ne180100]((uint64_t)&self->_meshImpl);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
