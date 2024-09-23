@implementation GESSAlgRepairTopologyExtended

- (BOOL)run:(id)a3
{
  id v4;
  uint64_t *v5;
  cv3d::cv::gess::mesh::TriMesh *v6;
  BOOL *v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  NSMutableData *v13;
  NSMutableData *vertexReorderedMappingData;
  _DWORD *v15;
  _DWORD *v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *__p[2];
  char v23;
  int v24;

  v4 = a3;
  -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 1);
  if ((objc_msgSend(v4, "valid") & 1) != 0 && objc_msgSend(v4, "meshType") == 1)
  {
    v5 = (uint64_t *)objc_msgSend(v4, "meshImpl");
    v24 = -1;
    std::string::basic_string[abi:ne180100]<0>(__p, "v:repair_output_to_input_mapping");
    cv3d::cv::gess::mesh::MeshProperty::AddAttribute<unsigned int>((uint64_t)v5, &v24, (__int128 *)__p);
    if (v23 < 0)
      operator delete(__p[0]);
    if (v5[14] != v5[13])
    {
      v8 = 0;
      v9 = 0;
      do
      {
        LODWORD(__p[0]) = v24;
        v10 = cv3d::cv::gess::mesh::AttributeContainer::attribute<unsigned int>(v5 + 1, (unsigned int *)__p);
        v11 = *(_QWORD *)(v10 + 40);
        if (v8 >= (*(_QWORD *)(v10 + 48) - v11) >> 2)
          __assert_rtn("operator[]", "Attribute.h", 182, "index < data_.size()");
        *(_DWORD *)(v11 + 4 * v8) = v9++;
        v8 = v9;
      }
      while (v9 < (unint64_t)((v5[14] - v5[13]) >> 2));
    }
    v12 = cv3d::cv::gess::alg::RepairEverything((cv3d::cv::gess::alg *)v5, v6, v7);
    if ((v12 & 1) != 0)
    {
      v13 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v5[14] - v5[13]);
      vertexReorderedMappingData = self->_vertexReorderedMappingData;
      self->_vertexReorderedMappingData = v13;

      v15 = -[NSMutableData mutableBytes](self->_vertexReorderedMappingData, "mutableBytes");
      if (v5[14] != v5[13])
      {
        v16 = v15;
        v17 = 0;
        v18 = 1;
        do
        {
          LODWORD(__p[0]) = v24;
          v19 = cv3d::cv::gess::mesh::AttributeContainer::attribute<unsigned int>(v5 + 1, (unsigned int *)__p);
          v20 = *(_QWORD *)(v19 + 40);
          if (v17 >= (*(_QWORD *)(v19 + 48) - v20) >> 2)
            __assert_rtn("operator[]", "Attribute.h", 182, "index < data_.size()");
          v16[v17] = *(_DWORD *)(v20 + 4 * v17);
          v17 = v18++;
        }
        while (v17 < (v5[14] - v5[13]) >> 2);
      }
      -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 3);
    }
    else
    {
      -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 2);
    }
  }
  else
  {
    -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 2);
    v12 = 0;
  }

  return v12;
}

- (id)returnVertexReordered
{
  return self->_vertexReorderedMappingData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexReorderedMappingData, 0);
}

@end
