@implementation GESSAlgVertexClusterSimplifyExtended

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)run:(id)a3
{
  id v4;
  __int32 v5;
  char v6;
  NSMutableData *v7;
  NSMutableData *clusterCenterPositions;
  NSMutableData *v9;
  NSMutableData *clusterCenterColors;
  NSMutableData *v11;
  NSMutableData *clusterCenterNormals;
  uint64_t v13;
  uint64_t v15[3];
  __int32 v16[2];
  void **v17;

  v4 = a3;
  -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 1);
  if ((objc_msgSend(v4, "valid") & 1) != 0 && objc_msgSend(v4, "meshType") == 1)
  {
    v16[1] = 0;
    -[GESSAlgVertexClusterSimplifyOptions voxelSize](self->_options, "voxelSize");
    v16[0] = v5;
    memset(v15, 0, sizeof(v15));
    v6 = cv3d::cv::gess::alg::VertexClusterCenters(objc_msgSend(v4, "meshImpl"), v15, v16);
    if ((v6 & 1) != 0)
    {
      Attribute2Bytes((uint64_t *)v15[0]);
      v7 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      clusterCenterPositions = self->_clusterCenterPositions;
      self->_clusterCenterPositions = v7;

      Attribute2Bytes((uint64_t *)(v15[0] + 24));
      v9 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      clusterCenterColors = self->_clusterCenterColors;
      self->_clusterCenterColors = v9;

      Attribute2Bytes((uint64_t *)(v15[0] + 48));
      v11 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
      clusterCenterNormals = self->_clusterCenterNormals;
      self->_clusterCenterNormals = v11;

      v13 = 3;
    }
    else
    {
      v13 = 2;
    }
    -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", v13);
    v17 = (void **)v15;
    std::vector<std::vector<unsigned long long>>::__destroy_vector::operator()[abi:ne180100](&v17);
  }
  else
  {
    -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", 2);
    v6 = 0;
  }

  return v6;
}

- (id)returnClusterCenterPositions
{
  return self->_clusterCenterPositions;
}

- (id)returnClusterCenterColors
{
  return self->_clusterCenterColors;
}

- (id)returnClusterCenterNormals
{
  return self->_clusterCenterNormals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterCenterNormals, 0);
  objc_storeStrong((id *)&self->_clusterCenterColors, 0);
  objc_storeStrong((id *)&self->_clusterCenterPositions, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
