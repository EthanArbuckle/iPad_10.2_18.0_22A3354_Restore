@implementation MTLGPUBVHBuilder

- (MTLGPUBVHBuilder)initWithDevice:(id)a3
{
  unsigned int *v4;
  int v5;
  int v6;
  int v7;
  __int128 *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  objc_super v14;
  __int128 v15;
  uint64_t v16;
  __int128 *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MTLGPUBVHBuilder;
  v4 = -[MTLBVHBuilder init](&v14, sel_init);
  if (!v4)
    return (MTLGPUBVHBuilder *)v4;
  *((_QWORD *)v4 + 1) = a3;
  *((_BYTE *)v4 + 144) = objc_msgSend(a3, "supportsFamily:", 1007);
  *((_BYTE *)v4 + 145) = objc_msgSend(a3, "supportsFamily:", 1008);
  *((_BYTE *)v4 + 146) = objc_msgSend(a3, "supportsFamily:", 1006);
  v4[4] = 64;
  v4[5] = 512;
  v4[6] = 0x2000;
  if ((objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", CFSTR("Apple")) & 1) != 0)
  {
    getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 1;
    v5 = 512;
  }
  else if (getBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize)
  {
    v5 = 512;
  }
  else
  {
    v5 = 64;
  }
  v4[7] = v5;
  if ((objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", CFSTR("Apple")) & 1) != 0)
  {
    getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize = 1;
    v6 = 256;
  }
  else if (getSpatialBinningTGSize(objc_object  {objcproto9MTLDevice}*)::threadgroupSize)
  {
    v6 = 256;
  }
  else
  {
    v6 = 64;
  }
  v4[8] = v6;
  if (objc_msgSend((id)objc_msgSend(a3, "name"), "containsString:", CFSTR("Apple")))
    v7 = 256;
  else
    v7 = 64;
  v4[9] = v7;
  v4[10] = 64;
  v4[11] = getDispatchBinsSmallTGSize((uint64_t)a3);
  *((_BYTE *)v4 + 48) = objc_msgSend(a3, "supportsFamily:", 1006);
  v13 = 0;
  *((_QWORD *)v4 + 7) = objc_msgSend(a3, "newLibraryWithURL:error:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:", CFSTR("MTLBVHBuilder"), CFSTR("metallib")), &v13);
  *((_QWORD *)v4 + 13) = v4[4];
  *(_QWORD *)&v15 = &off_1E0FE1C40;
  *((_QWORD *)&v15 + 1) = v4;
  v17 = &v15;
  std::__function::__value_func<objc_object  {objcproto23MTLComputePipelineState}* ()(PipelineKey const&)>::swap[abi:ne180100](&v15, (_QWORD *)v4 + 14);
  v8 = v17;
  if (v17 == &v15)
  {
    v9 = 4;
    v8 = &v15;
    goto LABEL_19;
  }
  if (v17)
  {
    v9 = 5;
LABEL_19:
    (*(void (**)(void))(*(_QWORD *)v8 + 8 * v9))();
  }
  v10 = (void *)*((_QWORD *)v4 + 1);
  if (v10)
  {
    objc_msgSend(v10, "maxThreadsPerThreadgroup");
  }
  else
  {
    v15 = 0uLL;
    v16 = 0;
  }
  v11 = v16;
  *(_OWORD *)(v4 + 38) = v15;
  *((_QWORD *)v4 + 21) = v11;
  objc_msgSend(v4, "initPipelinesWithDevice:", a3);
  return (MTLGPUBVHBuilder *)v4;
}

- (void)initPipelinesWithDevice:(id)a3
{
  uint64_t v4;
  MTLGPUBVHBuilderPipelineInfo *pipelineInfos;
  MTLGPUBVHBuilderPipelineInfo *v6;
  MTLGPUBVHBuilderPipelineInfo *v7;
  MTLGPUBVHBuilderPipelineInfo *v8;
  MTLGPUBVHBuilderPipelineInfo *v9;
  MTLGPUBVHBuilderPipelineInfo *v10;
  MTLGPUBVHBuilderPipelineInfo *v11;
  MTLGPUBVHBuilderPipelineInfo *v12;
  MTLGPUBVHBuilderPipelineInfo *v13;
  MTLGPUBVHBuilderPipelineInfo *v14;
  MTLGPUBVHBuilderPipelineInfo *v15;
  MTLGPUBVHBuilderPipelineInfo *v16;
  MTLGPUBVHBuilderPipelineInfo *v17;
  MTLGPUBVHBuilderPipelineInfo *v18;
  MTLGPUBVHBuilderPipelineInfo *v19;
  MTLGPUBVHBuilderPipelineInfo *v20;
  MTLGPUBVHBuilderPipelineInfo *v21;
  MTLGPUBVHBuilderPipelineInfo *v22;
  MTLGPUBVHBuilderPipelineInfo *v23;
  MTLGPUBVHBuilderPipelineInfo *v24;
  MTLGPUBVHBuilderPipelineInfo *v25;
  MTLGPUBVHBuilderPipelineInfo *v26;
  MTLGPUBVHBuilderPipelineInfo *v27;
  MTLGPUBVHBuilderPipelineInfo *v28;
  MTLGPUBVHBuilderPipelineInfo *v29;
  MTLGPUBVHBuilderPipelineInfo *v30;
  MTLGPUBVHBuilderPipelineInfo *v31;
  MTLGPUBVHBuilderPipelineInfo *v32;
  MTLGPUBVHBuilderPipelineInfo *v33;
  MTLGPUBVHBuilderPipelineInfo *v34;
  MTLGPUBVHBuilderPipelineInfo *v35;
  MTLGPUBVHBuilderPipelineInfo *v36;
  MTLGPUBVHBuilderPipelineInfo *v37;
  MTLGPUBVHBuilderPipelineInfo *v38;
  MTLGPUBVHBuilderPipelineInfo *v39;
  MTLGPUBVHBuilderPipelineInfo *v40;
  MTLGPUBVHBuilderPipelineInfo *v41;
  MTLGPUBVHBuilderPipelineInfo *v42;
  MTLGPUBVHBuilderPipelineInfo *v43;
  MTLGPUBVHBuilderPipelineInfo *v44;
  MTLGPUBVHBuilderPipelineInfo *v45;
  MTLGPUBVHBuilderPipelineInfo *v46;
  MTLGPUBVHBuilderPipelineInfo *v47;
  MTLGPUBVHBuilderPipelineInfo *v48;
  MTLGPUBVHBuilderPipelineInfo *v49;
  MTLGPUBVHBuilderPipelineInfo *v50;
  MTLGPUBVHBuilderPipelineInfo *v51;
  MTLGPUBVHBuilderPipelineInfo *v52;
  MTLGPUBVHBuilderPipelineInfo *v53;
  MTLGPUBVHBuilderPipelineInfo *v54;
  MTLGPUBVHBuilderPipelineInfo *v55;
  MTLGPUBVHBuilderPipelineInfo *v56;
  MTLGPUBVHBuilderPipelineInfo *v57;
  MTLGPUBVHBuilderPipelineInfo *v58;
  MTLGPUBVHBuilderPipelineInfo *v59;
  MTLGPUBVHBuilderPipelineInfo *v60;
  MTLGPUBVHBuilderPipelineInfo *v61;
  MTLGPUBVHBuilderPipelineInfo *v62;
  MTLGPUBVHBuilderPipelineInfo *v63;
  MTLGPUBVHBuilderPipelineInfo *v64;
  MTLGPUBVHBuilderPipelineInfo *v65;
  MTLGPUBVHBuilderPipelineInfo *v66;
  MTLGPUBVHBuilderPipelineInfo *v67;
  MTLGPUBVHBuilderPipelineInfo *v68;
  MTLGPUBVHBuilderPipelineInfo *v69;
  MTLGPUBVHBuilderPipelineInfo *v70;
  MTLGPUBVHBuilderPipelineInfo *v71;
  MTLGPUBVHBuilderPipelineInfo *v72;
  MTLGPUBVHBuilderPipelineInfo *v73;
  MTLGPUBVHBuilderPipelineInfo *v74;
  MTLGPUBVHBuilderPipelineInfo *v75;
  MTLGPUBVHBuilderPipelineInfo *v76;
  MTLGPUBVHBuilderPipelineInfo *v77;
  MTLGPUBVHBuilderPipelineInfo *v78;
  MTLGPUBVHBuilderPipelineInfo *v79;
  MTLGPUBVHBuilderPipelineInfo *v80;
  MTLGPUBVHBuilderPipelineInfo *v81;
  MTLGPUBVHBuilderPipelineInfo *v82;
  MTLGPUBVHBuilderPipelineInfo *v83;
  MTLGPUBVHBuilderPipelineInfo *v84;
  MTLGPUBVHBuilderPipelineInfo *v85;
  MTLGPUBVHBuilderPipelineInfo *v86;
  MTLGPUBVHBuilderPipelineInfo *v87;
  MTLGPUBVHBuilderPipelineInfo *v88;
  MTLGPUBVHBuilderPipelineInfo *v89;
  MTLGPUBVHBuilderPipelineInfo *v90;
  MTLGPUBVHBuilderPipelineInfo *v91;
  MTLGPUBVHBuilderPipelineInfo *v92;
  MTLGPUBVHBuilderPipelineInfo *v93;
  MTLGPUBVHBuilderPipelineInfo *v94;
  MTLGPUBVHBuilderPipelineInfo *v95;
  MTLGPUBVHBuilderPipelineInfo *v96;
  MTLGPUBVHBuilderPipelineInfo *v97;
  MTLGPUBVHBuilderPipelineInfo *v98;
  MTLGPUBVHBuilderPipelineInfo *v99;
  MTLGPUBVHBuilderPipelineInfo *v100;
  MTLGPUBVHBuilderPipelineInfo *v101;
  MTLGPUBVHBuilderPipelineInfo *v102;
  MTLGPUBVHBuilderPipelineInfo *v103;
  MTLGPUBVHBuilderPipelineInfo *v104;
  MTLGPUBVHBuilderPipelineInfo *v105;
  MTLGPUBVHBuilderPipelineInfo *v106;
  MTLGPUBVHBuilderPipelineInfo *v107;
  MTLGPUBVHBuilderPipelineInfo *v108;
  MTLGPUBVHBuilderPipelineInfo *v109;
  MTLGPUBVHBuilderPipelineInfo *v110;
  MTLGPUBVHBuilderPipelineInfo *v111;
  MTLGPUBVHBuilderPipelineInfo *v112;
  MTLGPUBVHBuilderPipelineInfo *v113;
  MTLGPUBVHBuilderPipelineInfo *v114;
  MTLGPUBVHBuilderPipelineInfo *v115;
  MTLGPUBVHBuilderPipelineInfo *v116;
  MTLGPUBVHBuilderPipelineInfo *v117;
  MTLGPUBVHBuilderPipelineInfo *v118;
  MTLGPUBVHBuilderPipelineInfo *v119;
  MTLGPUBVHBuilderPipelineInfo *v120;
  MTLGPUBVHBuilderPipelineInfo *v121;
  MTLGPUBVHBuilderPipelineInfo *v122;
  MTLGPUBVHBuilderPipelineInfo *v123;

  self->KERNEL_INDEX_DISPATCH_BINS = 0;
  self->KERNEL_INDEX_BIN_FRAGMENTS = 1;
  self->KERNEL_INDEX_CLEAR_BATCHES = 2;
  self->KERNEL_INDEX_CREATE_BVH_NODES = 3;
  self->KERNEL_INDEX_FIND_BEST_SPLIT = 4;
  self->KERNEL_INDEX_SPLIT_FRAGMENTS = 5;
  self->KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL = 6;
  self->KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT = 7;
  self->KERNEL_INDEX_INITIALIZE_QUEUE = 8;
  self->KERNEL_INDEX_INITIALIZE_DEBUG_FRAGMENT_INDICES = 9;
  self->KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES = 10;
  self->KERNEL_INDEX_INITIALIZE_FRAGMENTS = 11;
  self->KERNEL_INDEX_INITIALIZE_COUNTERS = 12;
  self->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS = 13;
  self->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS = 14;
  self->KERNEL_INDEX_GET_POLYGON_FRAGMENTS = 15;
  self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS = 16;
  self->KERNEL_INDEX_GET_CURVE_FRAGMENTS = 17;
  self->KERNEL_INDEX_WRITE_BVH_METADATA = 18;
  self->KERNEL_INDEX_SET_COUNTERS = 19;
  self->KERNEL_INDEX_COPY_COUNTERS = 20;
  self->KERNEL_INDEX_DISPATCH_INDIRECT = 21;
  self->KERNEL_INDEX_ENCODE_MTL_BVH_NODE0 = 22;
  self->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH = 23;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH = 24;
  self->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH_INNER_NODE = 25;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_INNER_NODE = 26;
  self->KERNEL_INDEX_ENCODE_MTL_TRIANGLE_BVH_LEAF_NODE = 27;
  self->KERNEL_INDEX_ENCODE_MTL_BBOX_BVH_LEAF_NODE = 28;
  self->KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_LEAF_NODE = 29;
  self->KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_CONTROL_POINTS = 30;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_DEFAULT = 31;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_USER_ID = 32;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT = 33;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_RESOURCE_IDS_DEFAULT = 34;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_RESOURCE_IDS_USER_ID = 35;
  self->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_RESOURCE_IDS_INDIRECT = 36;
  self->KERNEL_INDEX_GET_COMPACTED_MTL_BVH_SIZE_32 = 37;
  self->KERNEL_INDEX_GET_COMPACTED_MTL_BVH_SIZE_64 = 38;
  self->KERNEL_INDEX_GET_MTL_BVH_SIZE = 39;
  self->KERNEL_INDEX_GET_MTL_BVH_DEPTH = 40;
  self->KERNEL_INDEX_COPY_AND_COMPACT_MTL_BVH_HEADER = 41;
  self->KERNEL_INDEX_COPY_MTL_BVH_HEADER = 42;
  self->KERNEL_INDEX_COPY_MTL_BVH_INNER_NODES = 43;
  self->KERNEL_INDEX_COPY_MTL_BVH_LEAF_NODES = 44;
  self->KERNEL_INDEX_COPY_MTL_BVH_PRIMITIVES = 45;
  self->KERNEL_INDEX_COPY_MTL_BVH_GEOMETRIES = 46;
  self->KERNEL_INDEX_COPY_MTL_BVH_TRANSFORMS = 47;
  self->KERNEL_INDEX_COPY_MTL_PRIMITIVE_BVHS = 48;
  self->KERNEL_INDEX_COPY_MTL_BVH_CONTROL_POINTS = 49;
  self->KERNEL_INDEX_COPY_MTL_BVH_RESOURCE_IDS = 50;
  self->KERNEL_INDEX_GET_MTL_INSTANCE_BOUNDING_BOXES_DEFAULT = 51;
  self->KERNEL_INDEX_GET_MTL_INSTANCE_BOUNDING_BOXES_USER_ID = 52;
  self->KERNEL_INDEX_GET_MTL_INSTANCE_BOUNDING_BOXES_INDIRECT = 53;
  self->KERNEL_INDEX_COPY = 54;
  self->KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE = 55;
  self->KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE_IN_PLACE = 56;
  self->KERNEL_INDEX_REFIT_BBOX_LEAF_NODE = 57;
  self->KERNEL_INDEX_REFIT_BBOX_LEAF_NODE_IN_PLACE = 58;
  self->KERNEL_INDEX_REFIT_CURVE_LEAF_NODE = 59;
  self->KERNEL_INDEX_REFIT_CURVE_LEAF_NODE_IN_PLACE = 60;
  self->KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS = 61;
  self->KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS_IN_PLACE = 62;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT = 63;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID = 64;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT = 65;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT_IN_PLACE = 66;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID_IN_PLACE = 67;
  self->KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT_IN_PLACE = 68;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT = 69;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID = 70;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT = 71;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT_IN_PLACE = 72;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID_IN_PLACE = 73;
  self->KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT_IN_PLACE = 74;
  self->KERNEL_INDEX_REFIT_INNER_NODE = 75;
  self->KERNEL_INDEX_REFIT_INNER_NODE_IN_PLACE = 76;
  self->KERNEL_INDEX_REFIT_GEOMETRIES = 77;
  self->KERNEL_INDEX_REFIT_GEOMETRIES_IN_PLACE = 78;
  self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_SIZE = 79;
  self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_RAW_SIZE = 80;
  self->KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE = 81;
  self->KERNEL_INDEX_GET_DESERIALIZED_MTL_PRIMITIVE_BVH_SIZES = 82;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SERIALIZATION_DATA = 83;
  self->KERNEL_INDEX_WRITE_SERIALIZED_MTL_BVH = 84;
  self->KERNEL_INDEX_WRITE_DESERIALIZED_MTL_BVH = 85;
  self->KERNEL_INDEX_GET_GEOMETRY_SIZE = 86;
  self->KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT = 87;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVES = 88;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_1 = 89;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_1 = 90;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_INNER_NODES = 91;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_1 = 92;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVE_NODES = 93;
  self->KERNEL_INDEX_PATCH_SERIALIZED_MTL_BVH = 94;
  self->KERNEL_INDEX_PATCH_DESERIALIZED_MTL_BVH = 95;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY = 96;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_TRANSFORMS = 97;
  self->KERNEL_INDEX_DISPATCH_INDIRECT_64 = 98;
  self->KERNEL_INDEX_DISPATCH_BINS_WIDE = 99;
  self->KERNEL_INDEX_MEMCPY_INDIRECT_64 = 100;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_INIT = 101;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_FINISH_ITERATION = 102;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_CLASSIFY = 103;
  self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT = 104;
  self->KERNEL_INDEX_PREFIX_SUM = 105;
  self->KERNEL_INDEX_PREFIX_SUM_REDUCE = 106;
  self->KERNEL_INDEX_PREFIX_SUM_ADD = 107;
  self->KERNEL_INDEX_COPY_FRAGMENT_INDICES = 108;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_0 = 109;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_0 = 110;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_0 = 111;
  self->KERNEL_INDEX_WRITE_SERIALIZATION_DATA = 112;
  self->KERNEL_INDEX_ENCODE_PRIMITIVE_DATA = 113;
  self->KERNEL_INDEX_REFIT_PRIMITIVE_DATA = 114;
  self->KERNEL_INDEX_REFIT_PRIMITIVE_DATA_IN_PLACE = 115;
  self->KERNEL_INDEX_COPY_PRIMITIVE_DATA = 116;
  self->KERNEL_INDEX_EXTRACT_PRIMITIVE_DATA = 117;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_2 = 118;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2 = 119;
  self->KERNEL_INDEX_REFIT_HEADER = 120;
  self->KERNEL_INDEX_REFIT_HEADER_IN_PLACE = 121;
  self->KERNEL_INDEX_FINISH_BUILD_ITERATION = 122;
  self->KERNEL_INDEX_THREADGROUP_BREADTH_FIRST_LAYOUT = 123;
  self->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL = 124;
  self->KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT = 125;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_3 = 126;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_3 = 127;
  self->KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM = 128;
  self->KERNEL_INDEX_ZERO_BUFFER = 129;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_4 = 130;
  self->KERNEL_INDEX_WRITE_MTL_BVH_SIZES_1_5 = 131;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_4 = 132;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_5 = 133;
  self->KERNEL_INDEX_EXTRACT_CONTROL_POINT_DATA = 134;
  self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_5 = 135;
  v4 = operator new[]();
  self->_pipelineInfos = (MTLGPUBVHBuilderPipelineInfo *)v4;
  *(_QWORD *)v4 = "dispatchBinsKernel";
  *(_WORD *)(v4 + 8) = 257;
  *(_QWORD *)(v4 + 16) = "binFragmentsKernel";
  *(_WORD *)(v4 + 24) = 1;
  *(_QWORD *)(v4 + 32) = "clearBatchesKernel";
  *(_WORD *)(v4 + 40) = 1;
  *(_QWORD *)(v4 + 48) = "createBVHNodesKernel";
  *(_WORD *)(v4 + 56) = 1;
  *(_QWORD *)(v4 + 64) = "findBestSplitKernel";
  *(_WORD *)(v4 + 72) = 257;
  *(_QWORD *)(v4 + 80) = "splitFragmentsKernel";
  *(_WORD *)(v4 + 88) = 257;
  *(_QWORD *)(v4 + 96) = "binFragmentsSpatialKernel";
  *(_WORD *)(v4 + 104) = 0;
  *(_QWORD *)(v4 + 112) = "findBestSpatialSplitKernel";
  *(_WORD *)(v4 + 120) = 256;
  *(_QWORD *)(v4 + 128) = "initializeQueueKernel";
  *(_WORD *)(v4 + 136) = 1;
  *(_QWORD *)(v4 + 144) = "initializeDebugFragmentIndicesKernel";
  *(_WORD *)(v4 + 152) = 0;
  *(_QWORD *)(v4 + 160) = "initializeFragmentIndicesKernel";
  *(_WORD *)(v4 + 168) = 0;
  *(_QWORD *)(v4 + 176) = "initializeFragmentsKernel";
  *(_WORD *)(v4 + 184) = 1;
  *(_QWORD *)(v4 + 192) = "initializeCountersKernel";
  *(_WORD *)(v4 + 200) = 0;
  *(_QWORD *)(v4 + 208) = "initializeCountersForBinningKernel";
  *(_WORD *)(v4 + 216) = 0;
  *(_QWORD *)(v4 + 224) = "enqueueLeafNodeSplitsKernel";
  *(_WORD *)(v4 + 232) = 1;
  *(_QWORD *)(v4 + 240) = "getPolygonFragmentsKernel";
  *(_WORD *)(v4 + 248) = 257;
  *(_QWORD *)(v4 + 256) = "getBoundingBoxFragmentsKernel";
  *(_WORD *)(v4 + 264) = 257;
  pipelineInfos = self->_pipelineInfos;
  pipelineInfos[17].var0 = "getCurveFragmentsKernel";
  *(_WORD *)&pipelineInfos[17].var1 = 257;
  v6 = self->_pipelineInfos;
  v6[18].var0 = "writeBVHMetadataKernel";
  *(_WORD *)&v6[18].var1 = 1;
  v7 = self->_pipelineInfos;
  v7[19].var0 = "setCountersKernel";
  *(_WORD *)&v7[19].var1 = 0;
  v8 = self->_pipelineInfos;
  v8[20].var0 = "copyCountersKernel";
  *(_WORD *)&v8[20].var1 = 0;
  v9 = self->_pipelineInfos;
  v9[21].var0 = "dispatchIndirectKernel";
  *(_WORD *)&v9[21].var1 = 0;
  v10 = self->_pipelineInfos;
  v10[22].var0 = "encodeMTLBVHNode0Kernel";
  *(_WORD *)&v10[22].var1 = 1;
  v11 = self->_pipelineInfos;
  v11[23].var0 = "encodeMTLPrimitiveBVHKernel";
  *(_WORD *)&v11[23].var1 = 1;
  v12 = self->_pipelineInfos;
  v12[24].var0 = "encodeMTLInstanceBVHKernel";
  *(_WORD *)&v12[24].var1 = 1;
  v13 = self->_pipelineInfos;
  v13[25].var0 = "encodeMTLPrimitiveBVHInnerNodeKernel";
  *(_WORD *)&v13[25].var1 = 1;
  v14 = self->_pipelineInfos;
  v14[26].var0 = "encodeMTLInstanceBVHInnerNodeKernel";
  *(_WORD *)&v14[26].var1 = 1;
  v15 = self->_pipelineInfos;
  v15[27].var0 = "encodeMTLTriangleBVHLeafNodeKernel";
  *(_WORD *)&v15[27].var1 = 1;
  v16 = self->_pipelineInfos;
  v16[28].var0 = "encodeMTLBoundingBoxBVHLeafNodeKernel";
  *(_WORD *)&v16[28].var1 = 1;
  v17 = self->_pipelineInfos;
  v17[29].var0 = "encodeMTLCurveBVHLeafNodeKernel";
  *(_WORD *)&v17[29].var1 = 1;
  v18 = self->_pipelineInfos;
  v18[30].var0 = "encodeMTLCurveBVHControlPointsKernel";
  *(_WORD *)&v18[30].var1 = 0;
  v19 = self->_pipelineInfos;
  v19[31].var0 = "encodeMTLInstanceBVHLeafNodeKernel";
  *(_WORD *)&v19[31].var1 = 1;
  v20 = self->_pipelineInfos;
  v20[32].var0 = "encodeMTLInstanceBVHLeafNodeUserIDKernel";
  v20[32].var1 = 0;
  v21 = self->_pipelineInfos;
  v20[32].var2 = 0;
  v21[33].var0 = "encodeMTLInstanceBVHLeafNodeIndirectKernel";
  *(_WORD *)&v21[33].var1 = 1;
  v22 = self->_pipelineInfos;
  v22[34].var0 = "encodeMTLInstanceBVHResourceIDsKernel";
  *(_WORD *)&v22[34].var1 = 1;
  v23 = self->_pipelineInfos;
  v23[35].var0 = "encodeMTLInstanceBVHResourceIDsUserIDKernel";
  *(_WORD *)&v23[35].var1 = 0;
  v24 = self->_pipelineInfos;
  v24[36].var0 = "encodeMTLInstanceBVHResourceIDsIndirectKernel";
  v24[36].var1 = 1;
  v25 = self->_pipelineInfos;
  v24[36].var2 = 0;
  v25[37].var0 = "getCompactedMTLBVHSize32Kernel";
  *(_WORD *)&v25[37].var1 = 0;
  v26 = self->_pipelineInfos;
  v26[38].var0 = "getCompactedMTLBVHSize64Kernel";
  v26[38].var1 = 0;
  v27 = self->_pipelineInfos;
  v26[38].var2 = 0;
  v27[39].var0 = "getMTLBVHSizeKernel";
  *(_WORD *)&v27[39].var1 = 0;
  v28 = self->_pipelineInfos;
  v28[40].var0 = "getMTLBVHDepthKernel";
  *(_WORD *)&v28[40].var1 = 0;
  v29 = self->_pipelineInfos;
  v29[41].var0 = "copyAndCompactMTLBVHHeaderKernel";
  *(_WORD *)&v29[41].var1 = 0;
  v30 = self->_pipelineInfos;
  v30[42].var0 = "copyMTLBVHHeaderKernel";
  v30[42].var1 = 0;
  v31 = self->_pipelineInfos;
  v30[42].var2 = 0;
  v31[43].var0 = "copyMTLBVHInnerNodesKernel";
  *(_WORD *)&v31[43].var1 = 0;
  v32 = self->_pipelineInfos;
  v32[44].var0 = "copyMTLBVHLeafNodesKernel";
  v32[44].var1 = 0;
  v33 = self->_pipelineInfos;
  v32[44].var2 = 0;
  v33[45].var0 = "copyMTLBVHPrimitivesKernel";
  *(_WORD *)&v33[45].var1 = 0;
  v34 = self->_pipelineInfos;
  v34[46].var0 = "copyMTLBVHGeometriesKernel";
  *(_WORD *)&v34[46].var1 = 0;
  v35 = self->_pipelineInfos;
  v35[47].var0 = "copyMTLBVHTransformsKernel";
  *(_WORD *)&v35[47].var1 = 0;
  v36 = self->_pipelineInfos;
  v36[48].var0 = "copyMTLBVHPrimitiveBVHsKernel";
  v36[48].var1 = 0;
  v37 = self->_pipelineInfos;
  v36[48].var2 = 0;
  v37[49].var0 = "copyMTLBVHControlPointsKernel";
  *(_WORD *)&v37[49].var1 = 0;
  v38 = self->_pipelineInfos;
  v38[50].var0 = "copyMTLBVHResourceIDsKernel";
  v38[50].var1 = 0;
  v39 = self->_pipelineInfos;
  v38[50].var2 = 0;
  v39[51].var0 = "getMTLInstanceBoundsKernel";
  *(_WORD *)&v39[51].var1 = 1;
  v40 = self->_pipelineInfos;
  v40[52].var0 = "getMTLInstanceBoundsUserIDKernel";
  *(_WORD *)&v40[52].var1 = 0;
  v41 = self->_pipelineInfos;
  v41[53].var0 = "getMTLInstanceBoundsIndirectKernel";
  *(_WORD *)&v41[53].var1 = 1;
  v42 = self->_pipelineInfos;
  v42[54].var0 = "copyKernel";
  v42[54].var1 = 0;
  v43 = self->_pipelineInfos;
  v42[54].var2 = 0;
  v43[55].var0 = "refitTriangleLeafNodeKernel";
  *(_WORD *)&v43[55].var1 = 1;
  v44 = self->_pipelineInfos;
  v44[56].var0 = "refitTriangleLeafNodeInPlaceKernel";
  v44[56].var1 = 1;
  v45 = self->_pipelineInfos;
  v44[56].var2 = 0;
  v45[57].var0 = "refitBoundingBoxLeafNodeKernel";
  *(_WORD *)&v45[57].var1 = 1;
  v46 = self->_pipelineInfos;
  v46[58].var0 = "refitBoundingBoxLeafNodeInPlaceKernel";
  *(_WORD *)&v46[58].var1 = 1;
  v47 = self->_pipelineInfos;
  v47[59].var0 = "refitCurveLeafNodeKernel";
  *(_WORD *)&v47[59].var1 = 1;
  v48 = self->_pipelineInfos;
  v48[60].var0 = "refitCurveLeafNodeInPlaceKernel";
  v48[60].var1 = 1;
  v49 = self->_pipelineInfos;
  v48[60].var2 = 0;
  v49[61].var0 = "refitCurveControlPointsKernel";
  *(_WORD *)&v49[61].var1 = 0;
  v50 = self->_pipelineInfos;
  v50[62].var0 = "refitCurveControlPointsInPlaceKernel";
  v50[62].var1 = 0;
  v51 = self->_pipelineInfos;
  v50[62].var2 = 0;
  v51[63].var0 = "refitInstanceLeafNodeKernel";
  *(_WORD *)&v51[63].var1 = 1;
  v52 = self->_pipelineInfos;
  v52[64].var0 = "refitInstanceLeafNodeUserIDKernel";
  *(_WORD *)&v52[64].var1 = 0;
  v53 = self->_pipelineInfos;
  v53[65].var0 = "refitInstanceLeafNodeIndirectKernel";
  *(_WORD *)&v53[65].var1 = 1;
  v54 = self->_pipelineInfos;
  v54[66].var0 = "refitInstanceLeafNodeInPlaceKernel";
  v54[66].var1 = 1;
  v55 = self->_pipelineInfos;
  v54[66].var2 = 0;
  v55[67].var0 = "refitInstanceLeafNodeUserIDInPlaceKernel";
  *(_WORD *)&v55[67].var1 = 0;
  v56 = self->_pipelineInfos;
  v56[68].var0 = "refitInstanceLeafNodeIndirectInPlaceKernel";
  v56[68].var1 = 1;
  v57 = self->_pipelineInfos;
  v56[68].var2 = 0;
  v57[69].var0 = "refitInstanceResourceIDsKernel";
  *(_WORD *)&v57[69].var1 = 1;
  v58 = self->_pipelineInfos;
  v58[70].var0 = "refitInstanceResourceIDsUserIDKernel";
  *(_WORD *)&v58[70].var1 = 0;
  v59 = self->_pipelineInfos;
  v59[71].var0 = "refitInstanceResourceIDsIndirectKernel";
  *(_WORD *)&v59[71].var1 = 1;
  v60 = self->_pipelineInfos;
  v60[72].var0 = "refitInstanceResourceIDsInPlaceKernel";
  v60[72].var1 = 1;
  v61 = self->_pipelineInfos;
  v60[72].var2 = 0;
  v61[73].var0 = "refitInstanceResourceIDsUserIDInPlaceKernel";
  *(_WORD *)&v61[73].var1 = 0;
  v62 = self->_pipelineInfos;
  v62[74].var0 = "refitInstanceResourceIDsIndirectInPlaceKernel";
  v62[74].var1 = 1;
  v63 = self->_pipelineInfos;
  v62[74].var2 = 0;
  v63[75].var0 = "refitInnerNodeKernel";
  *(_WORD *)&v63[75].var1 = 1;
  v64 = self->_pipelineInfos;
  v64[76].var0 = "refitInnerNodeInPlaceKernel";
  *(_WORD *)&v64[76].var1 = 1;
  v65 = self->_pipelineInfos;
  v65[77].var0 = "refitGeometriesKernel";
  *(_WORD *)&v65[77].var1 = 0;
  v66 = self->_pipelineInfos;
  v66[78].var0 = "refitGeometriesInPlaceKernel";
  v66[78].var1 = 0;
  v67 = self->_pipelineInfos;
  v66[78].var2 = 0;
  v67[79].var0 = "getSerializedMTLBVHSizeKernel";
  *(_WORD *)&v67[79].var1 = 0;
  v68 = self->_pipelineInfos;
  v68[80].var0 = "getSerializedMTLBVHRawSizeKernel";
  v68[80].var1 = 0;
  v69 = self->_pipelineInfos;
  v68[80].var2 = 0;
  v69[81].var0 = "getDeserializedMTLBVHSizeKernel";
  *(_WORD *)&v69[81].var1 = 0;
  v70 = self->_pipelineInfos;
  v70[82].var0 = "getDeserializedMTLPrimitiveBVHSizesKernel";
  *(_WORD *)&v70[82].var1 = 0;
  v71 = self->_pipelineInfos;
  v71[83].var0 = "writeMTLBVHSerializationDataKernel";
  *(_WORD *)&v71[83].var1 = 0;
  v72 = self->_pipelineInfos;
  v72[84].var0 = "writeSerializedMTLBVHKernel";
  v72[84].var1 = 0;
  v73 = self->_pipelineInfos;
  v72[84].var2 = 0;
  v73[85].var0 = "writeDeserializedMTLBVHKernel";
  *(_WORD *)&v73[85].var1 = 0;
  v74 = self->_pipelineInfos;
  v74[86].var0 = "getSerializedGeometrySizeKernel";
  v74[86].var1 = 0;
  v75 = self->_pipelineInfos;
  v74[86].var2 = 0;
  v75[87].var0 = "getSerializedGeometryPrimitiveCountKernel";
  *(_WORD *)&v75[87].var1 = 0;
  v76 = self->_pipelineInfos;
  v76[88].var0 = "extractMTLBVHPrimitivesKernel";
  *(_WORD *)&v76[88].var1 = 0;
  v77 = self->_pipelineInfos;
  v77[89].var0 = "writeMTLGenericBVHSizesKernel_1_1";
  *(_WORD *)&v77[89].var1 = 0;
  v78 = self->_pipelineInfos;
  v78[90].var0 = "extractMTLGenericBVHHeaderKernel_1_1";
  v78[90].var1 = 0;
  v79 = self->_pipelineInfos;
  v78[90].var2 = 0;
  v79[91].var0 = "extractMTLGenericBVHInnerNodesKernel";
  *(_WORD *)&v79[91].var1 = 0;
  v80 = self->_pipelineInfos;
  v80[92].var0 = "extractMTLGenericBVHLeafNodesKernel_1_1";
  v80[92].var1 = 0;
  v81 = self->_pipelineInfos;
  v80[92].var2 = 0;
  v81[93].var0 = "extractMTLGenericBVHPrimitiveNodesKernel";
  *(_WORD *)&v81[93].var1 = 0;
  v82 = self->_pipelineInfos;
  v82[94].var0 = "writeSerializedMTLBVHPatchKernel";
  *(_WORD *)&v82[94].var1 = 0;
  v83 = self->_pipelineInfos;
  v83[95].var0 = "writeDeserializedMTLBVHPatchKernel";
  *(_WORD *)&v83[95].var1 = 0;
  v84 = self->_pipelineInfos;
  v84[96].var0 = "extractMTLGenericBVHGeometryKernel";
  v84[96].var1 = 0;
  v85 = self->_pipelineInfos;
  v84[96].var2 = 0;
  v85[97].var0 = "extractMTLGenericInstanceTransformKernel";
  *(_WORD *)&v85[97].var1 = 0;
  v86 = self->_pipelineInfos;
  v86[98].var0 = "dispatchIndirect64Kernel";
  v86[98].var1 = 0;
  v87 = self->_pipelineInfos;
  v86[98].var2 = 0;
  v87[99].var0 = "dispatchBinsWideKernel";
  v87[99].var1 = 1;
  v87[99].var2 = 1;
  v88 = self->_pipelineInfos;
  v88[100].var0 = "fastGPUMemcpyKernel";
  *(_WORD *)&v88[100].var1 = 0;
  v89 = self->_pipelineInfos;
  v89[101].var0 = "breadthFirstLayoutInitKernel";
  *(_WORD *)&v89[101].var1 = 0;
  v90 = self->_pipelineInfos;
  v90[102].var0 = "breadthFirstLayoutFinishIterationKernel";
  v90[102].var1 = 1;
  v91 = self->_pipelineInfos;
  v90[102].var2 = 0;
  v91[103].var0 = "breadthFirstLayoutClassifyKernel";
  *(_WORD *)&v91[103].var1 = 1;
  v92 = self->_pipelineInfos;
  v92[104].var0 = "breadthFirstLayoutKernel";
  v92[104].var1 = 1;
  v93 = self->_pipelineInfos;
  v92[104].var2 = 0;
  v93[105].var0 = "prefixSumKernel";
  *(_WORD *)&v93[105].var1 = 0;
  v94 = self->_pipelineInfos;
  v94[106].var0 = "prefixSumReduceKernel";
  *(_WORD *)&v94[106].var1 = 0;
  v95 = self->_pipelineInfos;
  v95[107].var0 = "prefixSumAddKernel";
  *(_WORD *)&v95[107].var1 = 0;
  v96 = self->_pipelineInfos;
  v96[108].var0 = "copyFragmentIndicesKernel";
  v96[108].var1 = 1;
  v97 = self->_pipelineInfos;
  v96[108].var2 = 0;
  v97[109].var0 = "writeMTLGenericBVHSizesKernel_1_0";
  *(_WORD *)&v97[109].var1 = 0;
  v98 = self->_pipelineInfos;
  v98[110].var0 = "extractMTLGenericBVHHeaderKernel_1_0";
  v98[110].var1 = 0;
  v99 = self->_pipelineInfos;
  v98[110].var2 = 0;
  v99[111].var0 = "extractMTLGenericBVHLeafNodesKernel_1_0";
  *(_WORD *)&v99[111].var1 = 0;
  v100 = self->_pipelineInfos;
  v100[112].var0 = "writeSerializationDataKernel";
  *(_WORD *)&v100[112].var1 = 0;
  v101 = self->_pipelineInfos;
  v101[113].var0 = "encodePrimitiveDataKernel";
  *(_WORD *)&v101[113].var1 = 0;
  v102 = self->_pipelineInfos;
  v102[114].var0 = "refitPrimitiveDataKernel";
  v102[114].var1 = 0;
  v103 = self->_pipelineInfos;
  v102[114].var2 = 0;
  v103[115].var0 = "refitPrimitiveDataInPlaceKernel";
  *(_WORD *)&v103[115].var1 = 0;
  v104 = self->_pipelineInfos;
  v104[116].var0 = "copyPrimitiveDataKernel";
  v104[116].var1 = 0;
  v105 = self->_pipelineInfos;
  v104[116].var2 = 0;
  v105[117].var0 = "extractMTLGenericBVHPrimitiveData";
  *(_WORD *)&v105[117].var1 = 0;
  v106 = self->_pipelineInfos;
  v106[118].var0 = "writeMTLGenericBVHSizesKernel_1_2";
  *(_WORD *)&v106[118].var1 = 0;
  v107 = self->_pipelineInfos;
  v107[119].var0 = "extractMTLGenericBVHGeometryKernel_1_2";
  *(_WORD *)&v107[119].var1 = 0;
  v108 = self->_pipelineInfos;
  v108[120].var0 = "refitHeaderKernel";
  v108[120].var1 = 1;
  v109 = self->_pipelineInfos;
  v108[120].var2 = 0;
  v109[121].var0 = "refitHeaderInPlaceKernel";
  *(_WORD *)&v109[121].var1 = 1;
  v110 = self->_pipelineInfos;
  v110[122].var0 = "finishBuildIterationKernel";
  v110[122].var1 = 0;
  v111 = self->_pipelineInfos;
  v110[122].var2 = 0;
  v111[123].var0 = "threadgroupBreadthFirstLayoutKernel";
  *(_WORD *)&v111[123].var1 = 1;
  v112 = self->_pipelineInfos;
  v112[124].var0 = "binFragmentsTemporalSplitKernel";
  *(_WORD *)&v112[124].var1 = 1;
  v113 = self->_pipelineInfos;
  v113[125].var0 = "findBestTemporalSplitKernel";
  v113[125].var1 = 0;
  v113[125].var2 = 1;
  v114 = self->_pipelineInfos;
  v114[126].var0 = "extractMTLGenericBVHLeafNodesKernel_1_3";
  v114[126].var1 = 0;
  v115 = self->_pipelineInfos;
  v114[126].var2 = 0;
  v115[127].var0 = "writeMTLGenericBVHSizesKernel_1_3";
  *(_WORD *)&v115[127].var1 = 0;
  v116 = self->_pipelineInfos;
  v116[128].var0 = "splitFragmentsPrefixSumKernel";
  v116[128].var1 = 1;
  v117 = self->_pipelineInfos;
  v116[128].var2 = 1;
  v117[129].var0 = "zeroBuffer";
  *(_WORD *)&v117[129].var1 = 0;
  v118 = self->_pipelineInfos;
  v118[130].var0 = "writeMTLGenericBVHSizesKernel_1_4";
  *(_WORD *)&v118[130].var1 = 0;
  v119 = self->_pipelineInfos;
  v119[131].var0 = "writeMTLGenericBVHSizesKernel_1_5";
  *(_WORD *)&v119[131].var1 = 0;
  v120 = self->_pipelineInfos;
  v120[132].var0 = "extractMTLGenericBVHHeaderKernel_1_4";
  v120[132].var1 = 0;
  v121 = self->_pipelineInfos;
  v120[132].var2 = 0;
  v121[133].var0 = "extractMTLGenericBVHHeaderKernel_1_5";
  *(_WORD *)&v121[133].var1 = 0;
  v122 = self->_pipelineInfos;
  v122[134].var0 = "extractMTLGenericBVHControlPointData";
  v122[134].var1 = 0;
  v123 = self->_pipelineInfos;
  v122[134].var2 = 0;
  v123[135].var0 = "extractMTLGenericBVHGeometryKernel_1_5";
  *(_WORD *)&v123[135].var1 = 0;
}

- (void)dealloc
{
  MTLGPUBVHBuilderPipelineInfo *pipelineInfos;
  objc_super v4;

  pipelineInfos = self->_pipelineInfos;
  if (pipelineInfos)
  {
    MEMORY[0x186DABFA4](pipelineInfos, 0x1050C80A90F5278);
    self->_pipelineInfos = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)MTLGPUBVHBuilder;
  -[MTLGPUBVHBuilder dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsDevice:(id)a3
{
  return objc_msgSend(a3, "supportsIndirectDrawAndDispatch");
}

- (unint64_t)maxDepthForDescriptor:(id)a3
{
  return _MTLClampMaxDepthForDescriptor((MTLBVHDescriptor *)a3);
}

- (BOOL)isCompatibleWithAccelerationStructure:(id)a3
{
  return a3 == 0x200000000;
}

- (BOOL)useSpatialSplitsForDescriptor:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count");
  if (v4)
  {
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType"))
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      LOBYTE(v4) = objc_msgSend(a3, "splitHeuristic") == 3;
    }
  }
  return v4;
}

- (BOOL)useResourceBufferForDescriptor:(id)a3
{
  BOOL result;
  void *v5;

  result = 1;
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count") <= 1
    && (objc_msgSend(a3, "primitiveMotion") & 1) == 0)
  {
    if (!objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "count"))
      return 0;
    v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "geometryDescriptors"), "objectAtIndexedSubscript:", 0);
    if ((objc_msgSend(v5, "primitiveType") || !objc_msgSend(v5, "transformationMatrixBuffer"))
      && (!objc_msgSend(v5, "primitiveDataBuffer") || !objc_msgSend(v5, "primitiveDataElementSize"))
      && objc_msgSend(v5, "primitiveType") != 2)
    {
      return 0;
    }
  }
  return result;
}

- (unint64_t)fragmentScratchSizeForDescriptor:(id)a3
{
  unint64_t v5;

  if (!objc_msgSend(a3, "deterministic"))
    return 0;
  v5 = -[MTLGPUBVHBuilder fragmentTotalThreadgroupCountForDescriptor:](self, "fragmentTotalThreadgroupCountForDescriptor:", a3);
  return +[MTLGPUBVHBuilder prefixSumScratchBufferSizeWithCapacity:](MTLGPUBVHBuilder, "prefixSumScratchBufferSizeWithCapacity:", v5)+ 4 * v5;
}

- (unint64_t)getBuildScratchBufferSizeForDescriptor:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unint64_t batchSize;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v36 = 0;
  v37 = 0;
  v34 = 0;
  v35 = 0;
  v33 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a3, &v37, &v33, &v36, &v35, &v34);
  v5 = 0;
  v6 = 0;
  if (v33 > 0x2000)
  {
    batchSize = self->_batchSize;
    v8 = (v33 + batchSize) / (batchSize + 1);
    if (v8 >= 2)
      v5 = 2 * v8;
    else
      v5 = 2;
    if ((v33 + batchSize - 1) / batchSize <= 1)
      v6 = 1;
    else
      v6 = (v33 + batchSize - 1) / batchSize;
  }
  v9 = -[MTLGPUBVHBuilder fragmentScratchSizeForDescriptor:](self, "fragmentScratchSizeForDescriptor:", a3);
  v10 = v33;
  v11 = (4 * v33 + 255) & 0xFFFFFFFFFFFFFF00;
  v12 = objc_msgSend(a3, "maxSubKeyframeTemporalSplits");
  v13 = 2 * v10 + 255;
  if (!v12)
    v13 = 0;
  v14 = (((((((((v13 + v11) & 0xFFFFFFFFFFFFFF00) + 259) & 0xFFFFFFFFFFFFFF00) + 271) & 0xFFFFFFFFFFFFFF00) + 271) & 0xFFFFFFFFFFFFFF00)
       + 3071) & 0xFFFFFFFFFFFFFF00;
  if (objc_msgSend(a3, "motion"))
    v15 = 256;
  else
    v15 = 0;
  if (objc_msgSend(a3, "motion"))
    v16 = 256;
  else
    v16 = 0;
  v17 = v16 + v15;
  if (objc_msgSend(a3, "motion"))
    v18 = 256;
  else
    v18 = 0;
  v19 = v18 + v17;
  if (objc_msgSend(a3, "motion"))
    v20 = 256;
  else
    v20 = 0;
  v21 = (24 * v5
       + 255
       + ((24 * v5
         + 255
         + ((192 * v6
           + 255
           + ((192 * v6
             + 255
             + ((192 * v6
               + 255
               + ((8 * v35
                 + 255
                 + 1536 * v6
                 + ((8 * v35 + 255 + ((v9 + v20 + v19 + v14 + 255) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00;
  v22 = objc_msgSend(a3, "motion");
  v23 = 76;
  if (v22)
    v23 = 140;
  v24 = (((16 * v6
         + 255
         + ((16 * v6
           + 255
           + ((4 * v6 + 255 + ((4 * v6 + 255 + ((v21 + v23 * v5 + 255) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)) & 0xFFFFFFFFFFFFFF00)
       + 275) & 0xFFFFFFFFFFFFFF00;
  v25 = objc_msgSend(a3, "motion");
  if (objc_msgSend(a3, "motion"))
    v26 = 768 * v6;
  else
    v26 = 0;
  if (v25)
    v27 = 768 * v6 + 267;
  else
    v27 = 256;
  v28 = (v27 + v26 + v24) & 0xFFFFFFFFFFFFFF00;
  if (objc_msgSend(a3, "motion"))
    v29 = 192 * v6 + 255;
  else
    v29 = 0;
  v30 = (v29 + v28) & 0xFFFFFFFFFFFFFF00;
  if (objc_msgSend(a3, "motion"))
    v31 = 192 * v6;
  else
    v31 = 0;
  return v30 + v31;
}

- (unint64_t)fragmentTotalThreadgroupCountForDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  int v9;

  v4 = (void *)objc_msgSend(a3, "geometryDescriptors");
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  for (i = 0; i != v6; ++i)
  {
    v9 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", i), "primitiveCount");
    if (v9)
      v7 += (v9 + self->_threadgroupSize - 1) / self->_threadgroupSize;
  }
  return v7;
}

- (id)retainedResourcesArrayWithEncoder:(id)a3
{
  void *v3;
  id v4;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(a3, "commandBuffer");
  if ((objc_msgSend(v3, "retainedReferences") & 1) != 0)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__MTLGPUBVHBuilder_retainedResourcesArrayWithEncoder___block_invoke;
  v6[3] = &unk_1E0FE28A8;
  v6[4] = v4;
  objc_msgSend(v3, "addCompletedHandler:", v6);
  return v4;
}

void __54__MTLGPUBVHBuilder_retainedResourcesArrayWithEncoder___block_invoke(uint64_t a1)
{

}

- (id)newResourceBufferWithDescriptor:(id)a3 retainedResources:(id)a4
{
  id v5;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v12;

  v5 = a3;
  v7 = (void *)objc_msgSend(a3, "geometryDescriptors");
  LODWORD(v5) = objc_msgSend(v5, "primitiveMotion");
  v8 = objc_msgSend(v7, "count");
  v12 = 0;
  v9 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", computeResourceBufferLength((int)v5, &v12, v8, v7), 0);
  v10 = objc_msgSend(v9, "contents");
  setResourceBufferContents(v10, (int)v5, v12, v8, v7, objc_msgSend(v9, "gpuAddress"));
  objc_msgSend(a4, "addObject:", v9);
  return v9;
}

- (void)setResourceBufferWithDescriptor:(id)a3 retainedResources:(id)a4 onEncoder:(id)a5 atIndex:(unint64_t)a6
{
  void *v11;
  int v12;
  unint64_t v13;
  size_t v14;
  size_t v15;
  int v16;
  char *v17;
  uint64_t v18;
  id v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a3, "geometryDescriptors");
  v12 = objc_msgSend(a3, "primitiveMotion");
  v13 = objc_msgSend(v11, "count");
  v20 = 0;
  v14 = computeResourceBufferLength(v12, &v20, v13, v11);
  v15 = v14;
  if (v13 > 0x10)
    v16 = 1;
  else
    v16 = v12;
  if ((v16 & 1) != 0)
  {
    v19 = (id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v14, 0);
    v17 = (char *)objc_msgSend(v19, "contents");
  }
  else
  {
    v17 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v17, v14);
    v19 = 0;
  }
  setResourceBufferContents((uint64_t)v17, v12, v20, v13, v11, objc_msgSend(v19, "gpuAddress"));
  if (v16)
  {
    objc_msgSend(a5, "setBuffer:offset:atIndex:", v19, 0, a6);
    objc_msgSend(a4, "addObject:", v19);

  }
  else
  {
    objc_msgSend(a5, "setBytes:length:atIndex:", v17, v15, a6);
  }
}

- (id)newIndirectBufferWithCapacity:(unint64_t)a3 withRetainedResources:(id)a4 indirectBufferStride:(unint64_t *)a5
{
  unint64_t v7;
  void *v8;

  if (self->_supportsDispatchThreadsWithIndirectBuffer)
    v7 = 12;
  else
    v7 = 256;
  v8 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", v7 * a3, 0);
  if (a5)
    *a5 = v7;
  objc_msgSend(a4, "addObject:", v8);
  return v8;
}

- (id)newPrimitiveCountBufferWithEncoder:(id)a3 descriptor:(id)a4 retainedResources:(id)a5
{
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v7 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4 * objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors", a3), "count"), 0);
  objc_msgSend(a5, "addObject:", v7);
  v8 = objc_msgSend(v7, "contents");
  if (objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
  {
    v9 = 0;
    do
    {
      *(_DWORD *)(v8 + 4 * v9) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", v9), "primitiveCount");
      ++v9;
    }
    while (v9 < objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"));
  }
  return v7;
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3 nodeOffset:(unint64_t *)a4 fragmentOffset:(unint64_t *)a5 fragmentIndexOffset:(unint64_t *)a6 childIndexOffset:(unint64_t *)a7
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a3, &v25, &v21, &v24, &v23, &v22);
  *a4 = 256;
  v12 = objc_msgSend(a3, "motion");
  v13 = 36;
  if (v12)
    v13 = 72;
  v14 = (v23 + v24) * v13 + 511;
  *a5 = v14 & 0xFFFFFFFFFFFFFF00;
  v15 = objc_msgSend(a3, "motion");
  v16 = 40;
  if (v15)
    v16 = 72;
  v17 = ((v14 | 0xF8) + v25 * v16) & 0xFFFFFFFFFFFFFF00;
  *a6 = v17;
  v18 = (v17 + 4 * v21 + 255) & 0xFFFFFFFFFFFFFF00;
  *a7 = v18;
  if (objc_msgSend(a3, "branchingFactor") != 2)
  {
    v19 = v24;
    v18 += 4 * v19 * objc_msgSend(a3, "branchingFactor");
  }
  return (v18 + 255) & 0xFFFFFFFFFFFFFF00;
}

- (unint64_t)getGenericBVHSizeForDescriptor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = 0;
  v5 = 0;
  v6 = 0;
  v4 = 0;
  return -[MTLGPUBVHBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:](self, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:", a3, &v7, &v6, &v5, &v4);
}

- (void)setCounters:(const CounterValue *)a3 numCounters:(unint64_t)a4 encoder:(id)a5
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_SET_COUNTERS_low;
  uint64_t v10;
  int64x2_t v11;
  unint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  int v15;
  _BYTE v16[20];
  __int128 v17;

  v14 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_SET_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_SET_COUNTERS);
  *(_OWORD *)&v16[4] = 0u;
  v17 = 0u;
  v15 = KERNEL_INDEX_SET_COUNTERS_low;
  *(_QWORD *)v16 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  objc_msgSend(a5, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v15, &v14));
  objc_msgSend(a5, "setBytes:length:atIndex:", a3, 16 * a4, 30);
  if (objc_msgSend(a5, "dispatchType") == 1)
    objc_msgSend(a5, "memoryBarrierWithScope:", 1);
  v12 = a4;
  v13 = vdupq_n_s64(1uLL);
  v10 = v14;
  v11 = v13;
  objc_msgSend(a5, "dispatchThreads:threadsPerThreadgroup:", &v12, &v10);
}

- (void)copyFromBuffer:(id)a3 sourceBufferOffset:(unint64_t)a4 toBuffer:(id)a5 destinationBufferOffset:(unint64_t)a6 length:(unint64_t)a7 encoder:(id)a8
{
  unint64_t v9;
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_COPY_low;
  unint64_t v16;
  unint64_t v17;
  int64x2_t v18;
  unint64_t v19;
  int64x2_t v20;
  unint64_t v21;
  _BYTE v22[24];
  __int128 v23;

  if (a7)
  {
    v9 = a7;
    v21 = 0;
    p_pipelineCache = &self->_pipelineCache;
    KERNEL_INDEX_COPY_low = LOBYTE(self->KERNEL_INDEX_COPY);
    *(_OWORD *)&v22[8] = 0u;
    v23 = 0u;
    *(_DWORD *)v22 = KERNEL_INDEX_COPY_low;
    *(_QWORD *)&v22[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    objc_msgSend(a8, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v22, &v21));
    objc_msgSend(a8, "setBuffer:offset:atIndex:", a5, 0, 28);
    objc_msgSend(a8, "setBuffer:offset:atIndex:", a3, 0, 29);
    *(_QWORD *)v22 = a4 >> 2;
    *(_QWORD *)&v22[8] = a6 >> 2;
    v9 += 3;
    *(_QWORD *)&v22[16] = v9 >> 2;
    objc_msgSend(a8, "setBytes:length:atIndex:", v22, 24, 30);
    v16 = (v21 + (v9 >> 2) - 1) / v21;
    if (objc_msgSend(a8, "dispatchType") == 1)
      objc_msgSend(a8, "memoryBarrierWithScope:", 1);
    v19 = v16;
    v20 = vdupq_n_s64(1uLL);
    v17 = v21;
    v18 = v20;
    objc_msgSend(a8, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
  }
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 threadgroupSize:(unint64_t)a10 encoder:(id)a11
{
  int v11;
  unint64_t threadgroupSize;
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_DISPATCH_INDIRECT_low;
  uint64_t v20;
  unint64_t v21;
  int64x2_t v22;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  _BYTE v29[20];
  __int128 v30;

  v11 = a8;
  threadgroupSize = a10;
  if (!a10)
    threadgroupSize = self->_threadgroupSize;
  v27 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_DISPATCH_INDIRECT_low = LOBYTE(self->KERNEL_INDEX_DISPATCH_INDIRECT);
  *(_OWORD *)&v29[4] = 0u;
  v30 = 0u;
  v28 = KERNEL_INDEX_DISPATCH_INDIRECT_low;
  *(_QWORD *)v29 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  objc_msgSend(a11, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v28, &v27));
  objc_msgSend(a11, "setBuffer:offset:atIndex:", a6, a7, 28);
  v28 = v11;
  *(_DWORD *)v29 = a9;
  objc_msgSend(a11, "setBytes:length:atIndex:", &v28, 8, 29);
  objc_msgSend(a11, "setBuffer:offset:atIndex:", a4, a5, 30);
  v20 = v27;
  if (objc_msgSend(a11, "dispatchType") == 1)
    objc_msgSend(a11, "memoryBarrierWithScope:", 1);
  v24 = vdupq_n_s64(1uLL);
  v25 = v24;
  v26 = 1;
  v23 = v20;
  objc_msgSend(a11, "dispatchThreadgroups:threadsPerThreadgroup:", &v25, &v23);
  if (objc_msgSend(a11, "dispatchType") == 1)
    objc_msgSend(a11, "memoryBarrierWithScope:", 1);
  objc_msgSend(a11, "setComputePipelineState:", a3);
  v21 = threadgroupSize;
  v22 = vdupq_n_s64(1uLL);
  objc_msgSend(a11, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a4, a5, &v21);
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10
{
  -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", a3, a4, a5, a6, a7, a8, a9, 0, a10);
}

- (void)fastIndirectGPUMemcpyWithEncoder:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 srcBuffer:(id)a6 srcBufferOffset:(unint64_t)a7 dstBuffer:(id)a8 dstBufferOffset:(unint64_t)a9 lengthBuffer:(id)a10 lengthOffset:(unint64_t)a11 retainedResources:(id)a12
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  void *Pipeline;
  void *v19;
  unsigned int v20;
  uint64_t threadgroupSize;
  uint64_t v24;
  int64x2_t v25;
  int64x2_t v26;
  uint64_t v27;
  int64x2_t v28;
  uint64_t v29;
  _DWORD v30[2];

  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_DISPATCH_INDIRECT_64, self->_pipelineCache.baseThreadgroupSize, 0);
  v19 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_MEMCPY_INDIRECT_64, p_pipelineCache->baseThreadgroupSize, 0);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a10, a11, 28);
  v20 = 16 * self->_threadgroupSize;
  v30[0] = 0;
  v30[1] = v20;
  objc_msgSend(a3, "setBytes:length:atIndex:", v30, 8, 29);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, 0, 30);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v28 = vdupq_n_s64(1uLL);
  v29 = 1;
  v26 = v28;
  v27 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v28, &v26);
  objc_msgSend(a3, "setComputePipelineState:", v19);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a10, a11, 2);
  threadgroupSize = self->_threadgroupSize;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v24 = threadgroupSize;
  v25 = vdupq_n_s64(1uLL);
  objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a4, a5, &v24);
}

- (void)dispatchIndirect64:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 threadCountBuffer:(id)a6 threadCountBufferOffset:(unint64_t)a7 threadCountIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10
{
  int v10;
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_DISPATCH_INDIRECT_64_low;
  uint64_t v19;
  uint64_t threadgroupSize;
  uint64_t v21;
  int64x2_t v22;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  _BYTE v29[20];
  __int128 v30;

  v10 = a8;
  v27 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_DISPATCH_INDIRECT_64_low = LOBYTE(self->KERNEL_INDEX_DISPATCH_INDIRECT_64);
  *(_OWORD *)&v29[4] = 0u;
  v30 = 0u;
  v28 = KERNEL_INDEX_DISPATCH_INDIRECT_64_low;
  *(_QWORD *)v29 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  objc_msgSend(a10, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v28, &v27));
  objc_msgSend(a10, "setBuffer:offset:atIndex:", a6, a7, 28);
  v28 = v10;
  *(_DWORD *)v29 = a9;
  objc_msgSend(a10, "setBytes:length:atIndex:", &v28, 8, 29);
  objc_msgSend(a10, "setBuffer:offset:atIndex:", a4, a5, 30);
  v19 = v27;
  if (objc_msgSend(a10, "dispatchType") == 1)
    objc_msgSend(a10, "memoryBarrierWithScope:", 1);
  v24 = vdupq_n_s64(1uLL);
  v25 = v24;
  v26 = 1;
  v23 = v19;
  objc_msgSend(a10, "dispatchThreadgroups:threadsPerThreadgroup:", &v25, &v23);
  objc_msgSend(a10, "setComputePipelineState:", a3);
  threadgroupSize = self->_threadgroupSize;
  if (objc_msgSend(a10, "dispatchType") == 1)
    objc_msgSend(a10, "memoryBarrierWithScope:", 1);
  v21 = threadgroupSize;
  v22 = vdupq_n_s64(1uLL);
  objc_msgSend(a10, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a4, a5, &v21);
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 counterBuffer:(id)a6 counterBufferOffset:(unint64_t)a7 counterIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 threadgroupSize:(unint64_t)a10 encoder:(id)a11
{
  if (a9 == 1)
    -[MTLGPUBVHBuilder dispatchIndirect:counterBuffer:counterBufferOffset:counterIndex:threadgroupSize:encoder:](self, "dispatchIndirect:counterBuffer:counterBufferOffset:counterIndex:threadgroupSize:encoder:", a3, a6, a7, a8, a10, a11);
  else
    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", a3, a4, a5, a6, a7, (a8 & 0xFFFFFFFFFFFFFFLL) << 6);
}

- (void)dispatchIndirect:(id)a3 indirectBuffer:(id)a4 indirectBufferOffset:(unint64_t)a5 counterBuffer:(id)a6 counterBufferOffset:(unint64_t)a7 counterIndex:(unint64_t)a8 threadgroupDivisor:(unint64_t)a9 encoder:(id)a10
{
  -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", a3, a4, a5, a6, a7, (a8 & 0xFFFFFFFFFFFFFFLL) << 6, a9, 0, a10);
}

- (void)dispatchIndirect:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5 counterIndex:(unint64_t)a6 threadgroupSize:(unint64_t)a7 encoder:(id)a8
{
  unint64_t threadgroupSize;
  unint64_t v13;
  int64x2_t v14;

  threadgroupSize = a7;
  if (!a7)
    threadgroupSize = self->_threadgroupSize;
  objc_msgSend(a8, "setComputePipelineState:", a3);
  if (objc_msgSend(a8, "dispatchType") == 1)
    objc_msgSend(a8, "memoryBarrierWithScope:", 1);
  v13 = threadgroupSize;
  v14 = vdupq_n_s64(1uLL);
  objc_msgSend(a8, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a4, a5 + (a6 << 8), &v13);
}

- (void)dispatchIndirect:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5 threadgroupSize:(unint64_t)a6 encoder:(id)a7
{
  unint64_t threadgroupSize;
  unint64_t v11;
  int64x2_t v12;

  threadgroupSize = a6;
  if (!a6)
    threadgroupSize = self->_threadgroupSize;
  objc_msgSend(a7, "setComputePipelineState:", a3);
  if (objc_msgSend(a7, "dispatchType") == 1)
    objc_msgSend(a7, "memoryBarrierWithScope:", 1);
  v11 = threadgroupSize;
  v12 = vdupq_n_s64(1uLL);
  objc_msgSend(a7, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a4, a5, &v11);
}

- (void)getPolygonFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int v28;
  int v29;
  uint64_t threadgroupSize;
  uint64_t v31;
  int KERNEL_INDEX_COPY_COUNTERS_low;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  MTLAttributeFormat v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  MTLAttributeFormat v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  unsigned int v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v76;
  uint64_t v78;
  void *v80;
  id v81;
  void *v82;
  void *Pipeline;
  int64x2_t v85;
  uint64_t v86;
  int64x2_t v87;
  int v88;
  uint64_t v89;
  int64x2_t v90;
  uint64_t v91;
  int64x2_t v92;
  _BYTE v93[24];
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int64x2_t v98;
  uint64_t v99;
  int64x2_t v100;
  int v101;
  int v102;
  uint64_t v103;
  int64x2_t v104;
  int64x2_t v105;
  uint64_t v106;

  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_FRAGMENTS, a4);
  v80 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_GET_POLYGON_FRAGMENTS, a4);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a13, a14, 7);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, a16, 8);
  if (objc_msgSend(a4, "primitiveMotion"))
  {
    *(_DWORD *)v93 = objc_msgSend(a4, "primitiveKeyframeCount");
    objc_msgSend(a3, "setBytes:length:atIndex:", v93, 4, 14);
    objc_msgSend(a4, "primitiveMotionStartTime");
    LODWORD(v96) = v28;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v96, 4, 15);
    objc_msgSend(a4, "primitiveMotionEndTime");
    LODWORD(v95) = v29;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v95, 4, 16);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a17, a18, 17);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a19, a20, 18);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a23, a24, 19);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a21, a22, 20);
  }
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  threadgroupSize = self->_threadgroupSize;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v105 = vdupq_n_s64(1uLL);
  v106 = 1;
  v103 = threadgroupSize;
  v104 = v105;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v105, &v103);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v82 = (void *)objc_msgSend(a4, "geometryDescriptors");
  v31 = objc_msgSend(v82, "count");
  if (a7)
  {
    v95 = 0;
    v96 = 0;
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
    {
      v81 = a5;
      v73 = a6 + 200;
      KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
      *(_OWORD *)&v93[8] = 0u;
      v94 = 0u;
      *(_DWORD *)v93 = KERNEL_INDEX_COPY_COUNTERS_low;
      *(_QWORD *)&v93[4] = (log2((double)p_pipelineCache->baseThreadgroupSize) & 0xF) << 13;
      v71 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v93, &v95);
      v33 = v82;
      if (!v31)
      {
LABEL_60:

        return;
      }
    }
    else
    {
      v47 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:", a3);
      v33 = v82;
      if ((unint64_t)objc_msgSend(v82, "count") <= 4)
        v48 = objc_msgSend(v82, "count");
      else
        v48 = 4;
      v81 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", v48, v47, &v96);
      v73 = 0;
      v71 = 0;
      if (!v31)
        goto LABEL_60;
    }
    v49 = 0;
    v70 = self->_threadgroupSize;
    v76 = a8;
    v78 = 0;
    v72 = v31;
    do
    {
      v50 = v49 + 4;
      v74 = v49 + 4;
      if (v49 + 4 >= (unint64_t)objc_msgSend(v33, "count"))
        v50 = objc_msgSend(v33, "count");
      if (self->_supportsDispatchThreadsWithIndirectBuffer)
      {
        *(_QWORD *)v93 = a8 + 4 * v49 + objc_msgSend(a7, "gpuAddress");
        *(_QWORD *)&v93[8] = objc_msgSend(v81, "gpuAddress") + v73;
        if (v50 != v49)
        {
          v51 = 0;
          v52 = v50 + v78;
          if ((unint64_t)(v50 + v78) <= 1)
            v52 = 1;
          v53 = (unsigned int *)&v93[20];
          do
          {
            *((_WORD *)v53 - 2) = 4 * v51;
            *((_WORD *)v53 - 1) = 12 * v51;
            *v53 = v70;
            v53 += 2;
            ++v51;
          }
          while (v52 != v51);
        }
        objc_msgSend(a3, "setComputePipelineState:", v71);
        objc_msgSend(a3, "setBytes:length:atIndex:", v93, 48, 30);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v91 = v50 - v49;
        v92 = vdupq_n_s64(1uLL);
        v89 = v95;
        v90 = v92;
        objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v91, &v89);
      }
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      objc_msgSend(a3, "setComputePipelineState:", v80);
      if (v50 != v49)
      {
        v54 = 0;
        v55 = v76;
        if ((unint64_t)(v50 + v78) <= 1)
          v56 = 1;
        else
          v56 = v50 + v78;
        v57 = v73;
        do
        {
          v58 = (void *)objc_msgSend(v33, "objectAtIndexedSubscript:", v49 + v54);
          if (objc_msgSend(v58, "primitiveCount"))
          {
            objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, v55, 0);
            objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v58, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v58, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
            objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v58, "indexBuffer"), objc_msgSend(v58, "indexBufferOffset"), 4);
            *(_DWORD *)v93 = v49 + v54;
            v102 = 0;
            v59 = objc_msgSend(v58, "polygonType");
            v101 = 0;
            v102 = v59;
            v60 = objc_msgSend(v58, "vertexStride");
            v61 = objc_msgSend(v58, "vertexFormat");
            if (!v60)
              LODWORD(v60) = MTLAttributeFormatSize(v61, v62, v63, v64, v65, v66, v67, v68);
            v101 = v60;
            v88 = 0;
            if (objc_msgSend(v58, "indexBuffer"))
            {
              if (objc_msgSend(v58, "indexType"))
                v69 = 4;
              else
                v69 = 2;
            }
            else
            {
              v69 = 0;
            }
            v33 = v82;
            v88 = v69;
            objc_msgSend(a3, "setBytes:length:atIndex:", v93, 4, 9);
            objc_msgSend(a3, "setBytes:length:atIndex:", &v102, 4, 10);
            objc_msgSend(a3, "setBytes:length:atIndex:", &v101, 4, 11);
            objc_msgSend(a3, "setBytes:length:atIndex:", &v88, 4, 12);
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              v86 = self->_threadgroupSize;
              v87 = vdupq_n_s64(1uLL);
              objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v81, v57, &v86);
            }
            else
            {
              -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v80, v81, v96 * v54, a7, a8, v49 + v54, self->_threadgroupSize, a3);
            }
          }
          ++v54;
          v57 += 12;
          v55 += 4;
        }
        while (v56 != v54);
      }
      v49 += 4;
      v76 += 16;
      v78 -= 4;
    }
    while (v74 < v72);
    goto LABEL_60;
  }
  objc_msgSend(a3, "setComputePipelineState:", v80);
  if (v31)
  {
    v34 = 0;
    v85 = vdupq_n_s64(1uLL);
    do
    {
      v35 = (void *)objc_msgSend(v82, "objectAtIndexedSubscript:", v34);
      *(_DWORD *)v93 = 0;
      *(_DWORD *)v93 = objc_msgSend(v35, "primitiveCount");
      if (*(_DWORD *)v93)
      {
        objc_msgSend(a3, "setBytes:length:atIndex:", v93, 4, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v35, "indexBuffer"), objc_msgSend(v35, "indexBufferOffset"), 4);
        LODWORD(v96) = v34;
        LODWORD(v95) = 0;
        LODWORD(v95) = objc_msgSend(v35, "polygonType");
        v102 = 0;
        v36 = objc_msgSend(v35, "vertexStride");
        v37 = objc_msgSend(v35, "vertexFormat");
        if (!v36)
          LODWORD(v36) = MTLAttributeFormatSize(v37, v38, v39, v40, v41, v42, v43, v44);
        v101 = 0;
        v102 = v36;
        if (objc_msgSend(v35, "indexBuffer"))
        {
          if (objc_msgSend(v35, "indexType"))
            v45 = 4;
          else
            v45 = 2;
        }
        else
        {
          v45 = 0;
        }
        v101 = v45;
        objc_msgSend(a3, "setBytes:length:atIndex:", &v96, 4, 9);
        objc_msgSend(a3, "setBytes:length:atIndex:", &v95, 4, 10);
        objc_msgSend(a3, "setBytes:length:atIndex:", &v102, 4, 11);
        objc_msgSend(a3, "setBytes:length:atIndex:", &v101, 4, 12);
        v46 = self->_threadgroupSize;
        v99 = (*(_DWORD *)v93 + (int)v46 - 1) / v46;
        v100 = v85;
        v97 = v46;
        v98 = v85;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v99, &v97);
      }
      ++v34;
    }
    while (v31 != v34);
  }
}

- (void)getBoundingBoxFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24 fragmentScratchBuffer:(id)a25 fragmentScratchBufferOffset:(unint64_t)a26
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  unsigned int KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t threadgroupSize;
  unint64_t v36;
  MTLGPUBVHBuilder *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  int KERNEL_INDEX_COPY_COUNTERS_low;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int i;
  _BOOL4 v47;
  char v48;
  void *v49;
  uint64_t j;
  void *v51;
  uint64_t v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  char v68;
  uint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  int v75;
  void *v76;
  unsigned int v77;
  void *v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v84;
  void *v85;
  int v87;
  id v88;
  MTLGPUBVHBuilder *v89;
  void *Pipeline;
  void *v92;
  uint64_t v93;
  int64x2_t v94;
  int v95;
  uint64_t v96;
  int64x2_t v97;
  uint64_t v98;
  int64x2_t v99;
  _OWORD v100[3];
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int64x2_t v104;
  uint64_t v105;
  int64x2_t v106;
  unint64_t v107;
  int64x2_t v108;
  unint64_t v109;
  int64x2_t v110;
  _QWORD *v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  int64x2_t v115;
  int64x2_t v116;
  uint64_t v117;
  _DWORD v118[5];

  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_FRAGMENTS, a4);
  v118[0] = 3;
  v89 = self;
  v87 = objc_msgSend(a4, "deterministic");
  if (v87)
  {
    KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS = self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS;
    v118[0] = 3;
    memset(v100, 0, 40);
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)p_pipelineCache, KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS, a4, p_pipelineCache->baseThreadgroupSize, v118, (uint64_t)v100);
    v71 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v100, 0);
    v118[0] |= 4u;
    v32 = self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS;
    memset(v100, 0, 40);
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)p_pipelineCache, v32, a4, p_pipelineCache->baseThreadgroupSize, v118, (uint64_t)v100);
    v85 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v100, 0);
  }
  else
  {
    v85 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_GET_BOUNDING_BOX_FRAGMENTS, a4);
    v71 = 0;
  }
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a13, a14, 7);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, a16, 8);
  if (objc_msgSend(a4, "primitiveMotion"))
  {
    LODWORD(v100[0]) = 0;
    LODWORD(v100[0]) = objc_msgSend(a4, "primitiveKeyframeCount");
    objc_msgSend(a3, "setBytes:length:atIndex:", v100, 4, 12);
    LODWORD(v111) = 0;
    objc_msgSend(a4, "primitiveMotionStartTime");
    LODWORD(v111) = v33;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v111, 4, 13);
    LODWORD(v102) = 0;
    objc_msgSend(a4, "primitiveMotionEndTime");
    LODWORD(v102) = v34;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v102, 4, 14);
  }
  if (objc_msgSend(a4, "motion"))
  {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a17, a18, 17);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a19, a20, 18);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a23, a24, 19);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a21, a22, 20);
  }
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  threadgroupSize = self->_threadgroupSize;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v116 = vdupq_n_s64(1uLL);
  v117 = 1;
  v114 = threadgroupSize;
  v115 = v116;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v116, &v114);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v92 = (void *)objc_msgSend(a4, "geometryDescriptors");
  v36 = objc_msgSend(v92, "count");
  v111 = 0;
  v112 = 0;
  v113 = 0;
  if ((v87 & 1) != 0)
  {
    std::vector<unsigned long>::resize((uint64_t)&v111, v36);
    v37 = self;
    if (v36)
    {
      v38 = 0;
      v39 = 0;
      do
      {
        v40 = objc_msgSend((id)objc_msgSend(v92, "objectAtIndexedSubscript:", v38), "primitiveCount");
        v111[v38] = 4 * v39;
        if (v40)
          v39 += (v40 + self->_threadgroupSize - 1) / self->_threadgroupSize;
        ++v38;
      }
      while (v36 != v38);
    }
    else
    {
      v39 = 0;
    }
    v69 = 4 * v39;
    if (a7)
    {
      objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_ZERO_BUFFER, p_pipelineCache->baseThreadgroupSize, 0));
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a25, a26, 0);
      LODWORD(v100[0]) = v39;
      objc_msgSend(a3, "setBytes:length:atIndex:", v100, 4, 1);
      v41 = self->_threadgroupSize;
      v109 = (v39 + v41 - 1) / v41;
      v110 = vdupq_n_s64(1uLL);
      v107 = v41;
      v108 = v110;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v109, &v107);
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 1);
      v74 = 2;
      goto LABEL_26;
    }
    v74 = 2;
  }
  else
  {
    v39 = 0;
    v69 = 0;
    v74 = 1;
    v37 = self;
    if (a7)
    {
LABEL_26:
      v101 = 0;
      v102 = 0;
      if (v37->_supportsDispatchThreadsWithIndirectBuffer)
      {
        v88 = a5;
        KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(v37->KERNEL_INDEX_COPY_COUNTERS);
        memset((char *)v100 + 8, 0, 32);
        LODWORD(v100[0]) = KERNEL_INDEX_COPY_COUNTERS_low;
        *(_QWORD *)((char *)v100 + 4) = (log2((double)p_pipelineCache->baseThreadgroupSize) & 0xF) << 13;
        v76 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v100, &v101);
        v80 = a6 + 200;
      }
      else
      {
        v43 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](v37, "retainedResourcesArrayWithEncoder:", a3);
        if ((unint64_t)objc_msgSend(v92, "count") <= 4)
          v44 = objc_msgSend(v92, "count");
        else
          v44 = 4;
        v88 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](v37, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", v44, v43, &v102);
        v80 = 0;
        v76 = 0;
      }
      v53 = 0;
      v54 = v37->_threadgroupSize;
      v70 = v36;
      v73 = v39;
      v77 = v54;
      do
      {
        v75 = v53;
        if (v37->_supportsDispatchThreadsWithIndirectBuffer)
          v55 = v36;
        else
          v55 = 1;
        v79 = v55;
        if (v55)
        {
          v56 = 0;
          v57 = 0;
          v58 = v71;
          if ((v87 & (v53 == 0)) == 0)
            v58 = v85;
          v78 = v58;
          v82 = a8;
          v84 = 0;
          do
          {
            v59 = v57 + 4;
            if (v57 + 4 >= (unint64_t)objc_msgSend(v92, "count"))
              v59 = objc_msgSend(v92, "count");
            if (v37->_supportsDispatchThreadsWithIndirectBuffer)
            {
              *(_QWORD *)&v100[0] = a8 + 4 * v57 + objc_msgSend(a7, "gpuAddress");
              *((_QWORD *)&v100[0] + 1) = objc_msgSend(v88, "gpuAddress") + v80;
              if (v59 != v57)
              {
                v60 = 0;
                v61 = v59 + v84;
                if ((unint64_t)(v59 + v84) <= 1)
                  v61 = 1;
                v62 = (unsigned int *)&v100[1] + 1;
                do
                {
                  *((_WORD *)v62 - 2) = 4 * v60;
                  *((_WORD *)v62 - 1) = 12 * v60;
                  *v62 = v54;
                  v62 += 2;
                  ++v60;
                }
                while (v61 != v60);
              }
              objc_msgSend(a3, "setComputePipelineState:", v76);
              objc_msgSend(a3, "setBytes:length:atIndex:", v100, 48, 30);
              if (objc_msgSend(a3, "dispatchType") == 1)
                objc_msgSend(a3, "memoryBarrierWithScope:", 1);
              v98 = v59 - v57;
              v99 = vdupq_n_s64(1uLL);
              v96 = v101;
              v97 = v99;
              objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v98, &v96);
            }
            if (objc_msgSend(a3, "dispatchType") == 1)
              objc_msgSend(a3, "memoryBarrierWithScope:", 1);
            objc_msgSend(a3, "setComputePipelineState:", v78);
            v81 = v57 + 4;
            if (v59 != v57)
            {
              v63 = 0;
              if ((unint64_t)(v59 + v84) <= 1)
                v64 = 1;
              else
                v64 = v59 + v84;
              v65 = v82;
              v66 = v80;
              do
              {
                v67 = (void *)objc_msgSend(v92, "objectAtIndexedSubscript:", v57 + v63);
                if (objc_msgSend(v67, "primitiveCount"))
                {
                  objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, v65, 0);
                  if (v87)
                    objc_msgSend(a3, "setBuffer:offset:atIndex:", a25, v111[v56 + v63] + a26, 21);
                  objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v67, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v67, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
                  LODWORD(v100[0]) = v57 + v63;
                  v95 = 0;
                  v95 = objc_msgSend(v67, "boundingBoxStride");
                  objc_msgSend(a3, "setBytes:length:atIndex:", v100, 4, 9);
                  objc_msgSend(a3, "setBytes:length:atIndex:", &v95, 4, 10);
                  if (v89->_supportsDispatchThreadsWithIndirectBuffer)
                  {
                    v93 = v89->_threadgroupSize;
                    v94 = vdupq_n_s64(1uLL);
                    objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v88, v66, &v93);
                  }
                  else
                  {
                    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](v89, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v85, v88, v102 * v63, a7, a8, v57 + v63, v89->_threadgroupSize, a3);
                  }
                }
                ++v63;
                v66 += 12;
                v65 += 4;
              }
              while (v64 != v63);
            }
            v57 += 4;
            v82 += 16;
            v84 -= 4;
            v56 += 4;
            v37 = v89;
            v54 = v77;
          }
          while (v81 < v79);
        }
        v68 = v87;
        if (v53)
          v68 = 0;
        if ((v68 & 1) != 0)
        {
          -[MTLGPUBVHBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](v37, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a25, a26, 0, 0, a25, v69, 0, 0, v73);
          if (objc_msgSend(a3, "dispatchType") == 1)
            objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        }
        ++v53;
        v36 = v70;
      }
      while (v75 + 1 != v74);

      goto LABEL_90;
    }
  }
  v72 = v39;
  v45 = v36;
  for (i = 0; i != v74; ++i)
  {
    v47 = i == 0;
    v48 = v87 & v47;
    if ((v87 & v47) != 0)
      v49 = v71;
    else
      v49 = v85;
    objc_msgSend(a3, "setComputePipelineState:", v49);
    if (v45)
    {
      for (j = 0; j != v45; ++j)
      {
        v51 = (void *)objc_msgSend(v92, "objectAtIndexedSubscript:", j);
        LODWORD(v100[0]) = 0;
        LODWORD(v100[0]) = objc_msgSend(v51, "primitiveCount");
        if (LODWORD(v100[0]))
        {
          objc_msgSend(a3, "setBytes:length:atIndex:", v100, 4, 0);
          if (v87)
            objc_msgSend(a3, "setBuffer:offset:atIndex:", a25, v111[j] + a26, 21);
          objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 3);
          LODWORD(v102) = j;
          LODWORD(v101) = 0;
          LODWORD(v101) = objc_msgSend(v51, "boundingBoxStride");
          objc_msgSend(a3, "setBytes:length:atIndex:", &v102, 4, 9);
          objc_msgSend(a3, "setBytes:length:atIndex:", &v101, 4, 10);
          v52 = v37->_threadgroupSize;
          v105 = (LODWORD(v100[0]) + (int)v52 - 1) / v52;
          v106 = vdupq_n_s64(1uLL);
          v103 = v52;
          v104 = v106;
          objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v105, &v103);
        }
      }
    }
    if ((v48 & 1) != 0)
    {
      -[MTLGPUBVHBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](v37, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a25, a26, 0, 0, a25, v69, 0, 0, v72);
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    }
  }
LABEL_90:
  if (v111)
  {
    v112 = v111;
    operator delete(v111);
  }
}

- (void)getCurveFragmentsWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 primitiveCountBuffer:(id)a7 primitiveCountBufferOffset:(unint64_t)a8 fragmentBuffer:(id)a9 fragmentBufferOffset:(unint64_t)a10 fragmentCountBuffer:(id)a11 fragmentCountBufferOffset:(unint64_t)a12 boundsMinBuffer:(id)a13 boundsMinBufferOffset:(unint64_t)a14 boundsMaxBuffer:(id)a15 boundsMaxBufferOffset:(unint64_t)a16 boundsEndMinBuffer:(id)a17 boundsEndMinBufferOffset:(unint64_t)a18 boundsEndMaxBuffer:(id)a19 boundsEndMaxBufferOffset:(unint64_t)a20 boundsEndTimeBuffer:(id)a21 boundsEndTimeBufferOffset:(unint64_t)a22 boundsStartTimeBuffer:(id)a23 boundsStartTimeBufferOffset:(unint64_t)a24
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int v29;
  int v30;
  uint64_t threadgroupSize;
  void *v32;
  uint64_t v33;
  int KERNEL_INDEX_COPY_COUNTERS_low;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unsigned int v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v55;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;
  id v62;
  id v63;
  void *Pipeline;
  int64x2_t v65;
  uint64_t v66;
  int64x2_t v67;
  uint64_t v68;
  int64x2_t v69;
  uint64_t v70;
  int64x2_t v71;
  _BYTE v72[24];
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int64x2_t v77;
  uint64_t v78;
  int64x2_t v79;
  uint64_t v80;
  int64x2_t v81;
  int64x2_t v82;
  uint64_t v83;

  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_FRAGMENTS, a4);
  v58 = (uint64_t)p_pipelineCache;
  v61 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_GET_CURVE_FRAGMENTS, a4);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a13, a14, 7);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, a16, 8);
  if (objc_msgSend(a4, "primitiveMotion"))
  {
    *(_DWORD *)v72 = objc_msgSend(a4, "primitiveKeyframeCount");
    objc_msgSend(a3, "setBytes:length:atIndex:", v72, 4, 14);
    objc_msgSend(a4, "primitiveMotionStartTime");
    LODWORD(v75) = v29;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v75, 4, 15);
    objc_msgSend(a4, "primitiveMotionEndTime");
    LODWORD(v74) = v30;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v74, 4, 16);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a17, a18, 17);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a19, a20, 18);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a23, a24, 19);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a21, a22, 20);
  }
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  threadgroupSize = self->_threadgroupSize;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v82 = vdupq_n_s64(1uLL);
  v83 = 1;
  v80 = threadgroupSize;
  v81 = v82;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v82, &v80);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v32 = (void *)objc_msgSend(a4, "geometryDescriptors");
  v33 = objc_msgSend(v32, "count");
  if (a7)
  {
    v74 = 0;
    v75 = 0;
    v62 = a7;
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
    {
      v63 = a5;
      v53 = a6 + 200;
      KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
      *(_OWORD *)&v72[8] = 0u;
      v73 = 0u;
      *(_DWORD *)v72 = KERNEL_INDEX_COPY_COUNTERS_low;
      *(_QWORD *)&v72[4] = (log2((double)*(unint64_t *)(v58 + 40)) & 0xF) << 13;
      v51 = PipelineCache<PipelineKey>::getPipeline(v58, (uint64_t)v72, &v74);
    }
    else
    {
      v38 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:", a3);
      if ((unint64_t)objc_msgSend(v32, "count") <= 4)
        v39 = objc_msgSend(v32, "count");
      else
        v39 = 4;
      v63 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", v39, v38, &v75);
      v53 = 0;
      v51 = 0;
    }
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
      v40 = v33;
    else
      v40 = 1;
    v52 = v40;
    if (v40)
    {
      v41 = 0;
      v50 = self->_threadgroupSize;
      v57 = a8;
      v59 = 0;
      do
      {
        v42 = v41 + 4;
        v55 = v41 + 4;
        if (v41 + 4 >= (unint64_t)objc_msgSend(v32, "count"))
          v42 = objc_msgSend(v32, "count");
        if (self->_supportsDispatchThreadsWithIndirectBuffer)
        {
          *(_QWORD *)v72 = a8 + 4 * v41 + objc_msgSend(v62, "gpuAddress");
          *(_QWORD *)&v72[8] = objc_msgSend(v63, "gpuAddress") + v53;
          if (v42 != v41)
          {
            v43 = 0;
            v44 = v42 + v59;
            if ((unint64_t)(v42 + v59) <= 1)
              v44 = 1;
            v45 = (unsigned int *)&v72[20];
            do
            {
              *((_WORD *)v45 - 2) = 4 * v43;
              *((_WORD *)v45 - 1) = 12 * v43;
              *v45 = v50;
              v45 += 2;
              ++v43;
            }
            while (v44 != v43);
          }
          objc_msgSend(a3, "setComputePipelineState:", v51);
          objc_msgSend(a3, "setBytes:length:atIndex:", v72, 48, 30);
          if (objc_msgSend(a3, "dispatchType") == 1)
            objc_msgSend(a3, "memoryBarrierWithScope:", 1);
          v70 = v42 - v41;
          v71 = vdupq_n_s64(1uLL);
          v68 = v74;
          v69 = v71;
          objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v70, &v68);
        }
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        objc_msgSend(a3, "setComputePipelineState:", v61);
        if (v42 != v41)
        {
          v46 = 0;
          if ((unint64_t)(v42 + v59) <= 1)
            v47 = 1;
          else
            v47 = v42 + v59;
          v48 = v57;
          v49 = v53;
          do
          {
            if (objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", v41 + v46), "primitiveCount"))
            {
              objc_msgSend(a3, "setBuffer:offset:atIndex:", v62, v48, 0);
              *(_DWORD *)v72 = v41 + v46;
              objc_msgSend(a3, "setBytes:length:atIndex:", v72, 4, 9);
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                v66 = self->_threadgroupSize;
                v67 = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v63, v49, &v66);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v61, v63, v75 * v46, v62, a8, v41 + v46, self->_threadgroupSize, a3);
              }
            }
            ++v46;
            v49 += 12;
            v48 += 4;
          }
          while (v47 != v46);
        }
        v41 += 4;
        v57 += 16;
        v59 -= 4;
      }
      while (v55 < v52);
    }

  }
  else
  {
    objc_msgSend(a3, "setComputePipelineState:", v61);
    if (v33)
    {
      v35 = 0;
      v65 = vdupq_n_s64(1uLL);
      do
      {
        v36 = (void *)objc_msgSend(v32, "objectAtIndexedSubscript:", v35);
        *(_DWORD *)v72 = 0;
        *(_DWORD *)v72 = objc_msgSend(v36, "primitiveCount");
        if (*(_DWORD *)v72)
        {
          objc_msgSend(a3, "setBytes:length:atIndex:", v72, 4, 0);
          LODWORD(v75) = v35;
          objc_msgSend(a3, "setBytes:length:atIndex:", &v75, 4, 9);
          v37 = self->_threadgroupSize;
          v78 = (*(_DWORD *)v72 + (int)v37 - 1) / v37;
          v79 = v65;
          v76 = v37;
          v77 = v65;
          objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v78, &v76);
        }
        ++v35;
      }
      while (v33 != v35);
    }
  }
}

- (void)buildWithEncoder:(id)a3 descriptor:(id)a4 scratchBuffer:(id)a5 scratchBufferOffset:(unint64_t)a6 fragmentBuffer:(id)a7 fragmentBufferOffset:(unint64_t)a8 fragmentIndexBuffer0:(id)a9 fragmentIndexBuffer0Offset:(unint64_t)a10 nodeBuffer:(id)a11 nodeBufferOffset:(unint64_t)a12 childIndexBuffer:(id)a13 childIndexBufferOffset:(unint64_t)a14 counterBuffer:(id)a15 counterBufferOffset:(unint64_t)a16 fragmentCountBuffer:(id)a17 fragmentCountBufferOffset:(unint64_t)a18 boundsMinBuffer:(id)a19 boundsMinBufferOffset:(unint64_t)a20 boundsMaxBuffer:(id)a21 boundsMaxBufferOffset:(unint64_t)a22 boundsEndMinBuffer:(id)a23 boundsEndMinBufferOffset:(unint64_t)a24 boundsEndMaxBuffer:(id)a25 boundsEndMaxBufferOffset:(unint64_t)a26 boundsEndTimeBuffer:(id)a27 boundsEndTimeBufferOffset:(unint64_t)a28 boundsStartTimeBuffer:(id)a29 boundsStartTimeBufferOffset:(unint64_t)a30 scratchBufferOffsets:(ScratchBufferOffset *)a31
{
  uint64_t v35;
  unint64_t v36;
  unint64_t batchSize;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unsigned int dispatchBinsTGSize;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int KERNEL_INDEX_DISPATCH_BINS_WIDE;
  long double v52;
  unsigned int KERNEL_INDEX_DISPATCH_BINS;
  long double v54;
  unint64_t v55;
  unsigned int v56;
  long double v57;
  unint64_t v58;
  char KERNEL_INDEX_BIN_FRAGMENTS;
  long double v60;
  unint64_t v61;
  uint64_t v62;
  unsigned int KERNEL_INDEX_CLEAR_BATCHES;
  unsigned int threadgroupSize;
  long double v65;
  unsigned int KERNEL_INDEX_CREATE_BVH_NODES;
  unsigned int v67;
  long double v68;
  unsigned int KERNEL_INDEX_FIND_BEST_SPLIT;
  unsigned int v70;
  long double v71;
  PipelineCache<PipelineKey> *v72;
  unsigned int KERNEL_INDEX_SPLIT_FRAGMENTS;
  unsigned int KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM;
  unsigned int v75;
  unsigned int v76;
  long double v77;
  uint64_t v78;
  char KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL;
  long double v80;
  unsigned int KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT;
  unsigned int v82;
  long double v83;
  unsigned int KERNEL_INDEX_INITIALIZE_QUEUE;
  unsigned int v85;
  long double v86;
  unint64_t v87;
  unsigned int KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES;
  unsigned int v89;
  long double v90;
  unint64_t v91;
  unsigned int KERNEL_INDEX_COPY_FRAGMENT_INDICES;
  unsigned int v93;
  long double v94;
  unsigned int KERNEL_INDEX_FINISH_BUILD_ITERATION;
  unsigned int v96;
  long double v97;
  id v98;
  unsigned int KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL;
  int v100;
  int v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  id v105;
  id v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t j;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t n;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t k;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t m;
  void *v138;
  int KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low;
  unsigned int v140;
  unint64_t v141;
  long double v142;
  int v143;
  _BOOL4 v144;
  _BOOL4 v145;
  _BOOL4 v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  void *v150;
  uint64_t v151;
  int v152;
  unsigned int v153;
  int v154;
  unint64_t v155;
  unsigned int v156;
  int v157;
  _BOOL4 v158;
  int v159;
  unint64_t v160;
  BOOL v161;
  int v162;
  unint64_t v163;
  int v164;
  void *v165;
  unint64_t *v166;
  void *v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  uint64_t v179;
  char v180;
  unint64_t v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  unint64_t var2;
  void *v189;
  void *v190;
  uint64_t v191;
  void *v192;
  unint64_t v193;
  unint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  _BOOL4 v198;
  unint64_t v199;
  unsigned int v200;
  unint64_t v201;
  unsigned int v202;
  uint64_t v204;
  id v205;
  unsigned __int8 *p_pipelineCache;
  unint64_t v207;
  int v209;
  unint64_t v210;
  unint64_t v211;
  unint64_t var1;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t spatialBinningTGSize;
  unint64_t v220;
  unint64_t v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *Pipeline;
  void *v227;
  int v228;
  _BOOL4 v229;
  void *v230;
  char v231;
  void *v232;
  unint64_t v233;
  void *v234;
  unint64_t v235;
  _BOOL4 v236;
  void *v237;
  unint64_t splitTGSize;
  unint64_t binningTGSize;
  unint64_t v240;
  unint64_t v241;
  void *v242;
  unint64_t v243;
  BOOL v244;
  unint64_t v245;
  int v246;
  unint64_t v247;
  unint64_t v248;
  int v249;
  id obj;
  id obja;
  unint64_t v252;
  unint64_t v253;
  uint64_t v254;
  _BOOL4 v255;
  uint64_t v257;
  int64x2_t v258;
  int64x2_t v259;
  uint64_t v260;
  uint64_t v261;
  int64x2_t v262;
  int64x2_t v263;
  uint64_t v264;
  uint64_t v265;
  unint64_t v266;
  uint64_t v267;
  int64x2_t v268;
  int64x2_t v269;
  uint64_t v270;
  _QWORD v271[2];
  int v272;
  _DWORD v273[2];
  int v274;
  uint64_t v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  uint64_t v296;
  int64x2_t v297;
  int64x2_t v298;
  uint64_t v299;
  __int128 v300;
  __int128 v301;
  uint64_t v302;
  int v303;
  unsigned int v304;
  unint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  _BYTE v310[40];
  _BYTE v311[128];
  _BYTE v312[128];
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  uint64_t v316;

  v316 = *MEMORY[0x1E0C80C00];
  v309 = 0;
  v308 = 0;
  v307 = 0;
  v306 = 0;
  v305 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a4, &v309, &v305, &v308, &v307, &v306);
  var1 = a31->var1;
  var2 = a31->var2;
  v210 = objc_msgSend(a4, "fragmentCount");
  v35 = 0;
  v36 = 0;
  if (v305 > 0x2000)
  {
    batchSize = self->_batchSize;
    v38 = (v305 + batchSize) / (batchSize + 1);
    if (v38 >= 2)
      v35 = 2 * v38;
    else
      v35 = 2;
    if ((v305 + batchSize - 1) / batchSize <= 1)
      v36 = 1;
    else
      v36 = (v305 + batchSize - 1) / batchSize;
  }
  v39 = 8 * v307 + 255;
  v247 = (a6 + 255) & 0xFFFFFFFFFFFFFF00;
  v211 = (v39 + v247) & 0xFFFFFFFFFFFFFF00;
  v193 = v39 + v211;
  v191 = v39 + v211 + 768 * v36;
  v40 = 192 * v36 + 255;
  v194 = (v191 + 768 * v36) & 0xFFFFFFFFFFFFFF00;
  v197 = (v40 + v194) & 0xFFFFFFFFFFFFFF00;
  v199 = (v40 + v197) & 0xFFFFFFFFFFFFFF00;
  v41 = 24 * v35 + 255;
  v201 = (v40 + v199) & 0xFFFFFFFFFFFFFF00;
  objc_msgSend(a4, "motion");
  if (objc_msgSend(a4, "motion"))
    v42 = 140;
  else
    v42 = 76;
  objc_msgSend(a4, "motion");
  if (objc_msgSend(a4, "motion"))
    v43 = 768 * v36;
  else
    v43 = 0;
  v187 = v43;
  objc_msgSend(a4, "motion");
  if (objc_msgSend(a4, "motion"))
    v44 = 768 * v36;
  else
    v44 = 0;
  v186 = v44;
  objc_msgSend(a4, "motion");
  if (objc_msgSend(a4, "motion"))
    v45 = 192 * v36 + 255;
  else
    v45 = 0;
  v185 = v45;
  objc_msgSend(a4, "motion");
  objc_msgSend(a4, "motion");
  obj = (id)objc_msgSend(a4, "geometryDescriptors");
  v46 = v305;
  v229 = +[MTLBVHBuilder useTemporalSplitsForDescriptor:](MTLBVHBuilder, "useTemporalSplitsForDescriptor:", a4);
  v207 = v46;
  if (v46 <= 0x2000)
  {
    v48 = &OBJC_IVAR___MTLGPUBVHBuilder__dispatchBinsTGSize;
    dispatchBinsTGSize = 256;
  }
  else
  {
    dispatchBinsTGSize = self->_dispatchBinsTGSize;
    v48 = &OBJC_IVAR___MTLGPUBVHBuilder__dispatchBinsSmallTGSize;
  }
  v253 = (v41 + v201) & 0xFFFFFFFFFFFFFF00;
  v233 = *(unsigned int *)((char *)&self->super.super.isa + *v48);
  binningTGSize = self->_binningTGSize;
  spatialBinningTGSize = self->_spatialBinningTGSize;
  splitTGSize = self->_splitTGSize;
  v49 = objc_msgSend(a4, "minPrimitivesPerLeaf");
  v195 = objc_msgSend(a4, "maxPrimitivesPerLeaf");
  v304 = -[MTLGPUBVHBuilder maxDepthForDescriptor:](self, "maxDepthForDescriptor:", a4);
  v204 = objc_msgSend(a4, "maxPrimitivesPerInnerNode");
  if (v204)
  {
    if (objc_msgSend(a4, "minPrimitivesPerInnerNode") <= (unint64_t)(2 * v49))
      v50 = 2 * v49;
    else
      v50 = objc_msgSend(a4, "minPrimitivesPerInnerNode");
    objc_msgSend(a4, "setMinPrimitivesPerLeaf:", v50);
    objc_msgSend(a4, "setMaxPrimitivesPerLeaf:", objc_msgSend(a4, "maxPrimitivesPerInnerNode"));
    objc_msgSend(a4, "updatePipelineKey");
  }
  v196 = v49;
  v228 = objc_msgSend(a4, "deterministic");
  v303 = (v204 == 0) | 2;
  v302 = 0;
  v300 = 0u;
  v301 = 0u;
  PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&self->_pipelineCache, self->KERNEL_INDEX_DISPATCH_BINS, a4, dispatchBinsTGSize, &v303, (uint64_t)&v300);
  p_pipelineCache = (unsigned __int8 *)&self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v300);
  v227 = 0;
  if (objc_msgSend(a4, "branchingFactor") != 2)
  {
    KERNEL_INDEX_DISPATCH_BINS_WIDE = self->KERNEL_INDEX_DISPATCH_BINS_WIDE;
    *(_OWORD *)v310 = v300;
    *(_OWORD *)&v310[16] = v301;
    *(_QWORD *)&v310[32] = v302;
    v310[0] = KERNEL_INDEX_DISPATCH_BINS_WIDE;
    if (dispatchBinsTGSize)
    {
      v52 = log2((double)dispatchBinsTGSize);
      *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v52 & 0xF) << 13);
    }
    v227 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  }
  v245 = (v41 + v253) & 0xFFFFFFFFFFFFFF00;
  KERNEL_INDEX_DISPATCH_BINS = self->KERNEL_INDEX_DISPATCH_BINS;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_DISPATCH_BINS;
  if ((_DWORD)v233)
  {
    v54 = log2((double)v233);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v54 & 0xF) << 13);
  }
  v55 = v245 + v42 * v35;
  v230 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  if (objc_msgSend(a4, "branchingFactor") == 2)
  {
    v232 = 0;
  }
  else
  {
    v56 = self->KERNEL_INDEX_DISPATCH_BINS_WIDE;
    *(_OWORD *)v310 = v300;
    *(_OWORD *)&v310[16] = v301;
    *(_QWORD *)&v310[32] = v302;
    v310[0] = v56;
    if ((_DWORD)v233)
    {
      v57 = log2((double)v233);
      *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v57 & 0xF) << 13);
    }
    v232 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  }
  v58 = v55 + 255;
  KERNEL_INDEX_BIN_FRAGMENTS = self->KERNEL_INDEX_BIN_FRAGMENTS;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_BIN_FRAGMENTS;
  if ((_DWORD)binningTGSize)
  {
    v60 = log2((double)binningTGSize);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v60 & 0xF) << 13);
  }
  v61 = v58 & 0xFFFFFFFFFFFFFF00;
  v62 = 4 * v36 + 255;
  v225 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  KERNEL_INDEX_CLEAR_BATCHES = self->KERNEL_INDEX_CLEAR_BATCHES;
  threadgroupSize = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_CLEAR_BATCHES;
  if (threadgroupSize)
  {
    v65 = log2((double)threadgroupSize);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v65 & 0xF) << 13);
  }
  v242 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  KERNEL_INDEX_CREATE_BVH_NODES = self->KERNEL_INDEX_CREATE_BVH_NODES;
  v67 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_CREATE_BVH_NODES;
  if (v67)
  {
    v68 = log2((double)v67);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v68 & 0xF) << 13);
  }
  v243 = (v62 + v61) & 0xFFFFFFFFFFFFFF00;
  v224 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  KERNEL_INDEX_FIND_BEST_SPLIT = self->KERNEL_INDEX_FIND_BEST_SPLIT;
  v70 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_FIND_BEST_SPLIT;
  if (v70)
  {
    v71 = log2((double)v70);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v71 & 0xF) << 13);
  }
  v72 = &self->_pipelineCache;
  v223 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  if (v228)
  {
    LODWORD(v271[0]) = (v204 == 0) | 2;
    KERNEL_INDEX_SPLIT_FRAGMENTS = self->KERNEL_INDEX_SPLIT_FRAGMENTS;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, KERNEL_INDEX_SPLIT_FRAGMENTS, a4, splitTGSize, v271, (uint64_t)v310);
    v218 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
    KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM = self->KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, KERNEL_INDEX_SPLIT_FRAGMENTS_PREFIX_SUM, a4, 0x400uLL, v271, (uint64_t)v310);
    v217 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
    LODWORD(v271[0]) |= 4u;
    v75 = self->KERNEL_INDEX_SPLIT_FRAGMENTS;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, v75, a4, splitTGSize, v271, (uint64_t)v310);
    v222 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
  }
  else
  {
    v76 = self->KERNEL_INDEX_SPLIT_FRAGMENTS;
    *(_OWORD *)v310 = v300;
    *(_OWORD *)&v310[16] = v301;
    *(_QWORD *)&v310[32] = v302;
    v310[0] = v76;
    if ((_DWORD)splitTGSize)
    {
      v77 = log2((double)splitTGSize);
      *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v77 & 0xF) << 13);
    }
    v72 = &self->_pipelineCache;
    v222 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
    v217 = 0;
    v218 = 0;
  }
  v235 = (v62 + v243) & 0xFFFFFFFFFFFFFF00;
  v78 = 16 * v36 + 255;
  KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL = self->KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_BIN_FRAGMENTS_SPATIAL;
  if ((_DWORD)spatialBinningTGSize)
  {
    v80 = log2((double)spatialBinningTGSize);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v80 & 0xF) << 13);
  }
  v216 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT = self->KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT;
  v82 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_FIND_BEST_SPATIAL_SPLIT;
  if (v82)
  {
    v83 = log2((double)v82);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v83 & 0xF) << 13);
  }
  v240 = (v78 + v235) & 0xFFFFFFFFFFFFFF00;
  v215 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  KERNEL_INDEX_INITIALIZE_QUEUE = self->KERNEL_INDEX_INITIALIZE_QUEUE;
  v85 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_INITIALIZE_QUEUE;
  if (v85)
  {
    v86 = log2((double)v85);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v86 & 0xF) << 13);
  }
  v87 = v78 + v240;
  v189 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES = self->KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES;
  v89 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_INITIALIZE_FRAGMENT_INDICES;
  if (v89)
  {
    v90 = log2((double)v89);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v90 & 0xF) << 13);
  }
  v205 = a4;
  v91 = v87 & 0xFFFFFFFFFFFFFF00;
  v190 = PipelineCache<PipelineKey>::getPipeline((uint64_t)v72, (uint64_t)v310);
  KERNEL_INDEX_COPY_FRAGMENT_INDICES = self->KERNEL_INDEX_COPY_FRAGMENT_INDICES;
  v93 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_COPY_FRAGMENT_INDICES;
  if (v93)
  {
    v94 = log2((double)v93);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v94 & 0xF) << 13);
  }
  v192 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  KERNEL_INDEX_FINISH_BUILD_ITERATION = self->KERNEL_INDEX_FINISH_BUILD_ITERATION;
  v96 = self->_threadgroupSize;
  *(_OWORD *)v310 = v300;
  *(_OWORD *)&v310[16] = v301;
  *(_QWORD *)&v310[32] = v302;
  v310[0] = KERNEL_INDEX_FINISH_BUILD_ITERATION;
  if (v96)
  {
    v97 = log2((double)v96);
    *(_QWORD *)&v310[4] = *(_QWORD *)&v310[4] & 0xFFFFFFFFFFFE1FFFLL | ((v97 & 0xF) << 13);
  }
  v252 = (v91 + 275) & 0xFFFFFFFFFFFFFF00;
  v237 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
  if (v229)
  {
    v98 = a4;
    KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL = self->KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL;
    LODWORD(v271[0]) = (v204 == 0) | 2;
    memset(v310, 0, sizeof(v310));
    PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, KERNEL_INDEX_BIN_FRAGMENTS_TEMPORAL, a4, binningTGSize, v271, (uint64_t)v310);
    v214 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310);
    v213 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, self->KERNEL_INDEX_FIND_BEST_TEMPORAL_SPLIT, a4, v204 == 0, 1);
  }
  else
  {
    v213 = 0;
    v214 = 0;
    v98 = a4;
  }
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v247, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a17, a18, 3);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v305, 8, 4);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a19, a20, 5);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a21, a22, 6);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v91, 7);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, a16, 8);
  if (objc_msgSend(v98, "motion"))
  {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a23, a24, 9);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a25, a26, 10);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a29, a30, 11);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a27, a28, 12);
  }
  objc_msgSend(a3, "setBytes:length:atIndex:", &v304, 4, 13);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v252, 30);
  if (v229)
  {
    objc_msgSend(a4, "primitiveMotionStartTime");
    *(_DWORD *)v310 = v100;
    objc_msgSend(a4, "primitiveMotionEndTime");
    *(_DWORD *)&v310[4] = v101;
    *(_DWORD *)&v310[8] = objc_msgSend(a4, "primitiveKeyframeCount");
    *(_DWORD *)&v310[12] = var2 - var1;
    objc_msgSend(a3, "setBytes:length:atIndex:", v310, 16, 14);
  }
  objc_msgSend(a3, "setComputePipelineState:", v189);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v297 = vdupq_n_s64(1uLL);
  v298 = v297;
  v299 = 1;
  v296 = self->_threadgroupSize;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v298, &v296);
  -[MTLGPUBVHBuilder dispatchIndirect:counterBuffer:counterBufferOffset:threadgroupSize:encoder:](self, "dispatchIndirect:counterBuffer:counterBufferOffset:threadgroupSize:encoder:", v190, a5, v252, self->_threadgroupSize, a3);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v91, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, a8, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v193 & 0xFFFFFFFFFFFFFF00, 7);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v191 & 0xFFFFFFFFFFFFFF00, 8);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v194, 9);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v61, 10);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v243, 11);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v197, 12);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v199, 13);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v201, 14);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v253, 15);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v235, 16);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v240, 17);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v245, 18);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 19);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a13, a14, 24);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, a16, 22);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 3);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, var1, 4);
  if (-[MTLGPUBVHBuilder useSpatialSplitsForDescriptor:](self, "useSpatialSplitsForDescriptor:", a4))
  {
    if (objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count"))
    {
      v102 = (void *)objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v102, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 20);
      v103 = objc_msgSend(v102, "indexBuffer");
      v104 = objc_msgSend(v102, "indexBufferOffset");
      v105 = a3;
      v106 = (id)v103;
LABEL_78:
      objc_msgSend(v105, "setBuffer:offset:atIndex:", v106, v104, 21);
    }
  }
  else if (objc_msgSend(a4, "motion"))
  {
    v107 = v252 + 267 + v187;
    v108 = (v107 + v186) & 0xFFFFFFFFFFFFFF00;
    v109 = v107 & 0xFFFFFFFFFFFFFF00;
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, (v252 + 267) & 0xFFFFFFFFFFFFFF00, 25);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v109, 26);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v108, 20);
    v105 = a3;
    v106 = a5;
    v104 = (v185 + v108) & 0xFFFFFFFFFFFFFF00;
    goto LABEL_78;
  }
  if (objc_msgSend(a4, "requiresResourceBuffer"))
  {
    v294 = 0u;
    v295 = 0u;
    v292 = 0u;
    v293 = 0u;
    v110 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v292, v315, 16);
    if (v110)
    {
      v111 = v110;
      v254 = *(_QWORD *)v293;
      do
      {
        for (i = 0; i != v111; ++i)
        {
          if (*(_QWORD *)v293 != v254)
            objc_enumerationMutation(obj);
          v113 = *(void **)(*((_QWORD *)&v292 + 1) + 8 * i);
          v114 = (void *)objc_opt_class();
          if (objc_msgSend(v114, "isSubclassOfClass:", objc_opt_class()))
          {
            v290 = 0u;
            v291 = 0u;
            v288 = 0u;
            v289 = 0u;
            v115 = (void *)objc_msgSend(v113, "vertexBuffers");
            v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v288, v314, 16);
            if (v116)
            {
              v117 = v116;
              v118 = *(_QWORD *)v289;
              do
              {
                for (j = 0; j != v117; ++j)
                {
                  if (*(_QWORD *)v289 != v118)
                    objc_enumerationMutation(v115);
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v288 + 1) + 8 * j), "buffer"), 1);
                }
                v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v288, v314, 16);
              }
              while (v117);
            }
            if (objc_msgSend(v113, "indexBuffer"))
              objc_msgSend(a3, "useResource:usage:", objc_msgSend(v113, "indexBuffer"), 1);
            if (objc_msgSend(v113, "transformationMatrixBuffer"))
            {
              v120 = objc_msgSend(v113, "transformationMatrixBuffer");
LABEL_122:
              objc_msgSend(a3, "useResource:usage:", v120, 1);
            }
          }
          else
          {
            v121 = (void *)objc_opt_class();
            if (!objc_msgSend(v121, "isSubclassOfClass:", objc_opt_class()))
            {
              v127 = (void *)objc_opt_class();
              if (!objc_msgSend(v127, "isSubclassOfClass:", objc_opt_class()))
                goto LABEL_123;
              v283 = 0u;
              v282 = 0u;
              v281 = 0u;
              v280 = 0u;
              v128 = (void *)objc_msgSend(v113, "controlPointBuffers");
              v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v280, v312, 16);
              if (v129)
              {
                v130 = v129;
                v131 = *(_QWORD *)v281;
                do
                {
                  for (k = 0; k != v130; ++k)
                  {
                    if (*(_QWORD *)v281 != v131)
                      objc_enumerationMutation(v128);
                    objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v280 + 1) + 8 * k), "buffer"), 1);
                  }
                  v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v280, v312, 16);
                }
                while (v130);
              }
              v279 = 0u;
              v278 = 0u;
              v277 = 0u;
              v276 = 0u;
              v133 = (void *)objc_msgSend(v113, "radiusBuffers");
              v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v276, v311, 16);
              if (v134)
              {
                v135 = v134;
                v136 = *(_QWORD *)v277;
                do
                {
                  for (m = 0; m != v135; ++m)
                  {
                    if (*(_QWORD *)v277 != v136)
                      objc_enumerationMutation(v133);
                    objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v276 + 1) + 8 * m), "buffer"), 1);
                  }
                  v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v276, v311, 16);
                }
                while (v135);
              }
              v120 = objc_msgSend(v113, "indexBuffer");
              goto LABEL_122;
            }
            v286 = 0u;
            v287 = 0u;
            v284 = 0u;
            v285 = 0u;
            v122 = (void *)objc_msgSend(v113, "boundingBoxBuffers");
            v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v284, v313, 16);
            if (v123)
            {
              v124 = v123;
              v125 = *(_QWORD *)v285;
              do
              {
                for (n = 0; n != v124; ++n)
                {
                  if (*(_QWORD *)v285 != v125)
                    objc_enumerationMutation(v122);
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v284 + 1) + 8 * n), "buffer"), 1);
                }
                v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v284, v313, 16);
              }
              while (v124);
            }
          }
LABEL_123:
          if (objc_msgSend(v113, "primitiveDataBuffer"))
            objc_msgSend(a3, "useResource:usage:", objc_msgSend(v113, "primitiveDataBuffer"), 1);
        }
        v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v292, v315, 16);
      }
      while (v111);
    }
  }
  v138 = v205;
  v236 = -[MTLGPUBVHBuilder useSpatialSplitsForDescriptor:](self, "useSpatialSplitsForDescriptor:", v205);
  v200 = objc_msgSend(v205, "branchingFactor");
  objc_msgSend(v205, "branchingFactor");
  v275 = 0;
  if (v207 > 0x2000)
  {
    KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS);
    memset(&v310[8], 0, 32);
    *(_DWORD *)v310 = KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS_low;
    *(_QWORD *)&v310[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, &v275);
  }
  v140 = v304;
  v141 = v247;
  if (v304)
  {
    v142 = log2((double)v200);
    v143 = 0;
    v202 = v142;
    v144 = v229;
    if (v207 <= 0x2000)
      v144 = 0;
    v198 = v144;
    obja = (id)(a16 + 512);
    v241 = a16 + 1024;
    v220 = a16 + 768;
    v221 = a16 + 1280;
    do
    {
      v274 = 0;
      v145 = v143 == v140 - 1 || v204 == 0;
      v146 = v143 != v140 - 1 || v204 == 0;
      if (v145)
        v147 = v140;
      else
        v147 = v140 - 1;
      v209 = v143;
      v273[0] = v143;
      v273[1] = v147;
      objc_msgSend(a3, "setBytes:length:atIndex:", v273, 12, 1);
      v248 = v141;
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v141, 5);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v211, 6);
      if (!v146)
      {
        objc_msgSend(v138, "setMinPrimitivesPerLeaf:", v196);
        objc_msgSend(v138, "setMaxPrimitivesPerLeaf:", v195);
        objc_msgSend(v138, "updatePipelineKey");
        v304 = objc_msgSend(v138, "maxDepth");
        v272 = 9;
        v148 = self->KERNEL_INDEX_DISPATCH_BINS;
        memset(v310, 0, sizeof(v310));
        PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, v148, v138, v233, &v272, (uint64_t)v310);
        v230 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
        v232 = 0;
        if (objc_msgSend(v138, "branchingFactor") != 2)
        {
          v149 = self->KERNEL_INDEX_DISPATCH_BINS_WIDE;
          memset(v310, 0, sizeof(v310));
          PipelineCache<PipelineKey>::getPipelineKey(p_pipelineCache, v149, v138, v233, &v272, (uint64_t)v310);
          v232 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, 0);
        }
        v150 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, self->KERNEL_INDEX_ENQUEUE_LEAF_NODE_SPLITS, v138, self->_threadgroupSize);
        v271[0] = objc_msgSend(a15, "gpuAddress") + a16;
        v271[1] = 0;
        -[MTLGPUBVHBuilder setCounters:numCounters:encoder:](self, "setCounters:numCounters:encoder:", v271, 1, a3);
        v151 = self->_threadgroupSize;
        if (self->_supportsDispatchThreadsWithIndirectBuffer)
        {
          objc_msgSend(a3, "setComputePipelineState:", v150);
          if (objc_msgSend(a3, "dispatchType") == 1)
            objc_msgSend(a3, "memoryBarrierWithScope:", 1);
          *(_QWORD *)v310 = v151;
          *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
          objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, a16 + 1536, v310);
        }
        else
        {
          -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v150, a5, v252, a15, a16, 6, v151, self->_threadgroupSize, a3);
        }
      }
      v152 = 0;
      if (objc_msgSend(v138, "useFastBuild") && v200 >= 3)
        v152 = objc_msgSend(v138, "deterministic") ^ 1;
      v153 = objc_msgSend(v138, "branchingFactor") - 1;
      v271[0] = 0;
      if (v207 <= 0x2000)
      {
        v234 = 0;
        if (v153 >= 2)
          v153 = 2;
      }
      else
      {
        v154 = LOBYTE(self->KERNEL_INDEX_INITIALIZE_BINNING_COUNTERS);
        memset(&v310[8], 0, 32);
        *(_DWORD *)v310 = v154;
        *(_QWORD *)&v310[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
        v234 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v310, v271);
      }
      v155 = v248;
      v156 = v200 - 1;
      if (v146)
        v156 = v202;
      if (!v152)
        v156 = v153;
      if (v156)
      {
        v157 = 0;
        v158 = v207 > 0x2000 && v146;
        v255 = v158;
        if (v209)
          v159 = v152;
        else
          v159 = 0;
        v249 = v146 & v159;
        v246 = v152 | v198;
        v160 = v211;
        v161 = v210 > 0x100 && v146;
        v244 = v161;
        v162 = -v156;
        v231 = v152;
        do
        {
          v163 = v155;
          objc_msgSend(a3, "setBuffer:offset:atIndex:", a5);
          objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v160, 6);
          if (v255)
          {
            objc_msgSend(a3, "setComputePipelineState:", v234);
            v269 = vdupq_n_s64(1uLL);
            v270 = 1;
            v267 = v271[0];
            v268 = v269;
            objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v269, &v267);
          }
          if (objc_msgSend(a3, "dispatchType") == 1)
            objc_msgSend(a3, "memoryBarrierWithScope:", 1);
          if (v157)
            v164 = 1;
          else
            v164 = v249;
          if ((v164 & v246) == 1)
          {
            v274 = v157;
            objc_msgSend(a3, "setBytes:length:atIndex:", v273, 12, 1);
          }
          if (v244)
          {
            if (v164)
              v165 = v227;
            else
              v165 = Pipeline;
            objc_msgSend(a3, "setComputePipelineState:", v165);
            v265 = dispatchBinsTGSize;
            v166 = (unint64_t *)&v265;
          }
          else
          {
            if (v164)
              v167 = v232;
            else
              v167 = v230;
            objc_msgSend(a3, "setComputePipelineState:", v167);
            v266 = v233;
            v166 = &v266;
          }
          v166[1] = 1;
          v166[2] = 1;
          objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, a16);
          if (v255)
          {
            v168 = self->_threadgroupSize;
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              objc_msgSend(a3, "setComputePipelineState:", v242);
              if (objc_msgSend(a3, "dispatchType") == 1)
                objc_msgSend(a3, "memoryBarrierWithScope:", 1);
              *(_QWORD *)v310 = v168;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, obja, v310);
            }
            else
            {
              -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v242, a5, v252, a15, a16, 2, 1, self->_threadgroupSize, a3);
            }
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              v169 = binningTGSize;
              if (!(_DWORD)binningTGSize)
                v169 = self->_threadgroupSize;
              objc_msgSend(a3, "setComputePipelineState:", v225);
              if (objc_msgSend(a3, "dispatchType") == 1)
                objc_msgSend(a3, "memoryBarrierWithScope:", 1);
              *(_QWORD *)v310 = v169;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v241, v310);
            }
            else
            {
              -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v225, a5, v252, a15, a16, 4, 1, binningTGSize, a3);
            }
            v170 = self->_threadgroupSize;
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              objc_msgSend(a3, "setComputePipelineState:", v223);
              if (objc_msgSend(a3, "dispatchType") == 1)
                objc_msgSend(a3, "memoryBarrierWithScope:", 1);
              *(_QWORD *)v310 = v170;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, obja, v310);
            }
            else
            {
              -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v223, a5, v252, a15, a16, 2, 1, self->_threadgroupSize, a3);
            }
            if (v236)
            {
              v171 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                objc_msgSend(a3, "setComputePipelineState:", v242);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v171;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, obja, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v242, a5, v252, a15, a16, 2, 1, self->_threadgroupSize, a3);
              }
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                v172 = spatialBinningTGSize;
                if (!(_DWORD)spatialBinningTGSize)
                  v172 = self->_threadgroupSize;
                objc_msgSend(a3, "setComputePipelineState:", v216);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v172;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v221, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v216, a5, v252, a15, a16, 5, 1, spatialBinningTGSize, a3);
              }
              v173 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                objc_msgSend(a3, "setComputePipelineState:", v215);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v173;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v220, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v215, a5, v252, a15, a16, 3, 1, self->_threadgroupSize, a3);
              }
            }
            if (v229)
            {
              v174 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                objc_msgSend(a3, "setComputePipelineState:", v242);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v174;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, obja, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v242, a5, v252, a15, a16, 2, 1, self->_threadgroupSize, a3);
              }
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                v175 = binningTGSize;
                if (!(_DWORD)binningTGSize)
                  v175 = self->_threadgroupSize;
                objc_msgSend(a3, "setComputePipelineState:", v214);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v175;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v221, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v214, a5, v252, a15, a16, 5, 1, binningTGSize, a3);
              }
              v176 = self->_threadgroupSize;
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                objc_msgSend(a3, "setComputePipelineState:", v213);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v176;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v220, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v213, a5, v252, a15, a16, 3, 1, self->_threadgroupSize, a3);
              }
            }
            if (v228)
            {
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                v177 = splitTGSize;
                if (!(_DWORD)splitTGSize)
                  v177 = self->_threadgroupSize;
                objc_msgSend(a3, "setComputePipelineState:", v218);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_QWORD *)v310 = v177;
                *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v241, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v218, a5, v252, a15, a16, 4, 1, splitTGSize, a3);
              }
              if (self->_supportsDispatchThreadsWithIndirectBuffer)
              {
                objc_msgSend(a3, "setComputePipelineState:", v217);
                if (objc_msgSend(a3, "dispatchType") == 1)
                  objc_msgSend(a3, "memoryBarrierWithScope:", 1);
                *(_OWORD *)v310 = xmmword_1827FE410;
                *(_QWORD *)&v310[16] = 1;
                objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, obja, v310);
              }
              else
              {
                -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v217, a5, v252, a15, a16, 2, 1, 1024, a3);
              }
            }
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              v178 = splitTGSize;
              if (!(_DWORD)splitTGSize)
                v178 = self->_threadgroupSize;
              objc_msgSend(a3, "setComputePipelineState:", v222);
              if (objc_msgSend(a3, "dispatchType") == 1)
                objc_msgSend(a3, "memoryBarrierWithScope:", 1);
              *(_QWORD *)v310 = v178;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, v241, v310);
            }
            else
            {
              -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v222, a5, v252, a15, a16, 4, 1, splitTGSize, a3);
            }
            v179 = self->_threadgroupSize;
            if (self->_supportsDispatchThreadsWithIndirectBuffer)
            {
              objc_msgSend(a3, "setComputePipelineState:", v224);
              LOBYTE(v152) = v231;
              if (objc_msgSend(a3, "dispatchType") == 1)
                objc_msgSend(a3, "memoryBarrierWithScope:", 1);
              *(_QWORD *)v310 = v179;
              *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
              objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, obja, v310);
            }
            else
            {
              -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v224, a5, v252, a15, a16, 2, 1, self->_threadgroupSize, a3);
              LOBYTE(v152) = v231;
            }
          }
          v180 = v152 ^ 1;
          if (v162 + v157 == -1)
            v180 = 1;
          if ((v180 & 1) != 0)
          {
            v181 = v160;
            v155 = v163;
            v160 = v163;
          }
          else
          {
            objc_msgSend(a3, "setComputePipelineState:", v237);
            if (objc_msgSend(a3, "dispatchType") == 1)
              objc_msgSend(a3, "memoryBarrierWithScope:", 1);
            v263 = vdupq_n_s64(1uLL);
            v264 = 1;
            v261 = self->_threadgroupSize;
            v262 = v263;
            objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v263, &v261);
            v181 = v163;
            v155 = v160;
          }
          ++v157;
          v182 = v160;
          v160 = v181;
        }
        while (v162 + v157);
      }
      else
      {
        v181 = v211;
        v182 = v248;
      }
      v211 = v182;
      objc_msgSend(a3, "setComputePipelineState:", v237, v155);
      v138 = v205;
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v259 = vdupq_n_s64(1uLL);
      v260 = 1;
      v257 = self->_threadgroupSize;
      v258 = v259;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v259, &v257);
      v183 = (unint64_t)(float)((float)v210 * 1.08);
      if (!v236)
        v183 = v210;
      v210 = (unint64_t)(float)((float)(1.4 / (float)v200) * (float)v183);
      v143 = v209 + 1;
      v140 = v304;
      v141 = v181;
    }
    while (v209 + 1 < v304);
  }
  v184 = self->_threadgroupSize;
  if (self->_supportsDispatchThreadsWithIndirectBuffer)
  {
    objc_msgSend(a3, "setComputePipelineState:", v192);
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    *(_QWORD *)v310 = v184;
    *(int64x2_t *)&v310[8] = vdupq_n_s64(1uLL);
    objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a15, a16 + 1536, v310);
  }
  else
  {
    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:counterBuffer:counterBufferOffset:counterIndex:threadgroupDivisor:threadgroupSize:encoder:", v192, a5, v252, a15, a16, 6, 1, self->_threadgroupSize, a3);
  }
}

- (void)writeBVHHeaderWithEncoder:(id)a3 descriptor:(id)a4 tmpCounterBuffer:(id)a5 tmpCounterBufferOffset:(unint64_t)a6 nodeBuffer:(id)a7 nodeBufferOffset:(unint64_t)a8 headerBuffer:(id)a9 headerBufferOffset:(unint64_t)a10 nodeOffset:(unint64_t)a11 fragmentOffset:(unint64_t)a12 fragmentIndexOffset:(unint64_t)a13 childIndexOffset:(unint64_t)a14 size:(unint64_t)a15
{
  uint64_t threadgroupSize;
  void *Pipeline;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;

  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_BVH_METADATA, a4);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, a6, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, a8, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 2);
  v30 = a12;
  v31 = a11;
  v28 = a14;
  v29 = a13;
  v27 = a15;
  objc_msgSend(a3, "setBytes:length:atIndex:", &v31, 8, 3);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v30, 8, 4);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v29, 8, 5);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v28, 8, 6);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v27, 8, 7);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  threadgroupSize = self->_threadgroupSize;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v24 = vdupq_n_s64(1uLL);
  v25 = v24;
  v26 = 1;
  v23 = threadgroupSize;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v25, &v23);
}

- (void)initializeCounterBuffer:(id)a3 counterBuffer:(id)a4 counterBufferOffset:(unint64_t)a5
{
  unsigned int binningTGSize;
  unsigned int spatialBinningTGSize;
  unsigned int threadgroupSize;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int32x4_t v15;
  unsigned int v16;
  unsigned int v17;
  int32x4_t v18;
  unsigned int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  binningTGSize = self->_binningTGSize;
  spatialBinningTGSize = self->_spatialBinningTGSize;
  threadgroupSize = self->_threadgroupSize;
  v15 = vdupq_n_s32(threadgroupSize);
  v16 = binningTGSize;
  v17 = spatialBinningTGSize;
  v18 = v15;
  v19 = threadgroupSize;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_INITIALIZE_COUNTERS, self->_pipelineCache.baseThreadgroupSize, 0));
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 29);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v15, 44, 30);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v13 = xmmword_1827FE420;
  v14 = 1;
  v11 = xmmword_1827FE430;
  v12 = 1;
  objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v13, &v11);
}

- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8 primitiveCountBuffer:(id)a9 primitiveCountBufferOffset:(unint64_t)a10
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  unint64_t v49;
  MTLGPUBVHBuilder *v50;
  unint64_t v51;
  MTLGPUBVHBuilder *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  MTLGPUBVHBuilder *v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  id v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  id v74;
  _QWORD v75[3];
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  if (objc_msgSend(a4, "splitHeuristic") != 2 && objc_msgSend(a4, "splitHeuristic") != 3)
    MTLReportFailure(0, "-[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:]", 5294, (uint64_t)CFSTR("GPU BVH builder only supports BinnedSAH and BinnedSpatialSAH split heuristics"), v16, v17, v18, v19, v55);
  if ((unint64_t)objc_msgSend(a4, "branchingFactor") < 2
    || (unint64_t)objc_msgSend(a4, "branchingFactor") >= 9)
  {
    MTLReportFailure(0, "-[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:]", 5296, (uint64_t)CFSTR("Branching factor must be between 2 and 8 inclusive"), v20, v21, v22, v23, v55);
  }
  v64 = a5;
  v74 = a3;
  if (!+[MTLGPUBVHBuilder supportsDevice:](MTLGPUBVHBuilder, "supportsDevice:", self->_device))
    MTLReportFailure(0, "-[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:]", 5298, (uint64_t)CFSTR("GPU BVH builder is not supported on this Metal device"), v24, v25, v26, v27, v55);
  v83 = 0;
  v84 = 0;
  v81 = 0;
  v82 = 0;
  v80 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a4, &v84, &v80, &v83, &v82, &v81);
  v78 = 0;
  v79 = 0;
  v76 = 0;
  v77 = 0;
  v73 = -[MTLGPUBVHBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:](self, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:", a4, &v79, &v78, &v77, &v76);
  objc_msgSend(a4, "updatePipelineKey");
  v71 = -[MTLGPUBVHBuilder fragmentScratchSizeForDescriptor:](self, "fragmentScratchSizeForDescriptor:", a4);
  v28 = v80;
  v29 = (((a8 + 255) | 0xFC) + 4 * v80) & 0xFFFFFFFFFFFFFF00;
  v30 = objc_msgSend(a4, "maxSubKeyframeTemporalSplits");
  v31 = 2 * v28 + 255;
  if (!v30)
    v31 = 0;
  v72 = v29;
  v67 = (v31 + v29) & 0xFFFFFFFFFFFFFF00;
  v66 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
  v32 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
  v33 = (v32 + 271) & 0xFFFFFFFFFFFFFF00;
  if (objc_msgSend(a4, "motion"))
    v34 = 256;
  else
    v34 = 0;
  v65 = (v33 + 3071) & 0xFFFFFFFFFFFFFF00;
  v35 = v34 + v65;
  if (objc_msgSend(a4, "motion"))
    v36 = 256;
  else
    v36 = 0;
  v37 = v36 + v35;
  if (objc_msgSend(a4, "motion"))
    v38 = 256;
  else
    v38 = 0;
  v63 = v37;
  v39 = v38 + v37;
  if (objc_msgSend(a4, "motion"))
    v40 = 256;
  else
    v40 = 0;
  v70 = (v32 + 271) & 0xFFFFFFFFFFFFFF00;
  -[MTLGPUBVHBuilder initializeCounterBuffer:counterBuffer:counterBufferOffset:](self, "initializeCounterBuffer:counterBuffer:counterBufferOffset:", v74, a7, v70);
  v41 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:", v74);
  if (objc_msgSend(a4, "requiresResourceBuffer"))
    -[MTLGPUBVHBuilder setResourceBufferWithDescriptor:retainedResources:onEncoder:atIndex:](self, "setResourceBufferWithDescriptor:retainedResources:onEncoder:atIndex:", a4, v41, v74, 23);
  v68 = v40 + v39;
  v62 = v35;
  v61 = v39;
  if (!objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count")
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType"))
  {
    v58 = v39;
    v51 = v63;
    v42 = v64;
    v56 = v35;
    v50 = self;
    v46 = v65;
    v47 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
    v49 = v67;
    v52 = self;
    v48 = v74;
    -[MTLGPUBVHBuilder getPolygonFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:](v52, "getPolygonFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:", v74, a4, v64, a6, a9, a10, v64, v78 + a6, a7, v67, a7, v66, a7, (v66 + 271) & 0xFFFFFFFFFFFFFF00,
      a7,
      v65,
      a7,
      v56,
      a7,
      v63,
      a7,
      v58);
LABEL_29:
    v44 = v61;
    v43 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
    v45 = v51;
    goto LABEL_30;
  }
  v60 = self;
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType") != 1)
  {
    v48 = v74;
    v54 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "objectAtIndexedSubscript:", 0), "primitiveType");
    v44 = v39;
    v49 = v67;
    v43 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
    v46 = (v33 + 3071) & 0xFFFFFFFFFFFFFF00;
    v47 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
    v53 = v35;
    v45 = v63;
    v42 = v64;
    v50 = v60;
    if (v54 != 2)
      goto LABEL_31;
    v51 = v63;
    -[MTLGPUBVHBuilder getCurveFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:](v60, "getCurveFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:", v74, a4, v64, a6, a9, a10, v64, v78 + a6, a7, v67, a7, v66, a7, v43,
      a7,
      v65,
      a7,
      v53,
      a7,
      v63,
      a7,
      v44);
    goto LABEL_29;
  }
  v59 = v40 + v39;
  v57 = v39;
  v42 = v64;
  -[MTLGPUBVHBuilder getBoundingBoxFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:fragmentScratchBuffer:fragmentScratchBufferOffset:](self, "getBoundingBoxFragmentsWithEncoder:descriptor:outputBuffer:outputBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:fragmentScratchBuffer:fragmentScratchBufferOffset:", v64, v78 + a6, a7, v67, a7, v66, a7, v32, a7, v65, a7, v35, a7,
    v63,
    a7,
    v57,
    a7,
    v59);
  v44 = v61;
  v43 = (v66 + 271) & 0xFFFFFFFFFFFFFF00;
  v45 = v63;
  v46 = (v33 + 3071) & 0xFFFFFFFFFFFFFF00;
  v47 = (v67 + 259) & 0xFFFFFFFFFFFFFF00;
  v48 = v74;
  v49 = v67;
  v50 = v60;
LABEL_30:
  v53 = v62;
LABEL_31:
  v75[0] = 0;
  v75[1] = (a8 + 255) & 0xFFFFFFFFFFFFFF00;
  v75[2] = v72;
  -[MTLGPUBVHBuilder buildWithEncoder:descriptor:scratchBuffer:scratchBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentIndexBuffer0:fragmentIndexBuffer0Offset:nodeBuffer:nodeBufferOffset:childIndexBuffer:childIndexBufferOffset:counterBuffer:counterBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:scratchBufferOffsets:](v50, "buildWithEncoder:descriptor:scratchBuffer:scratchBufferOffset:fragmentBuffer:fragmentBufferOffset:fragmentIndexBuffer0:fragmentIndexBuffer0Offset:nodeBuffer:nodeBufferOffset:childIndexBuffer:childIndexBufferOffset:counterBuffer:counterBufferOffset:fragmentCountBuffer:fragmentCountBufferOffset:boundsMinBuffer:boundsMinBufferOffset:boundsMaxBuffer:boundsMaxBufferOffset:boundsEndMinBuffer:boundsEndMinBufferOffset:boundsEndMaxBuffer:boundsEndMaxBufferOffset:boundsEndTimeBuffer:boundsEndTimeBufferOffset:boundsStartTimeBuffer:boundsStartTimeBufferOffset:scratchBufferOffsets:", v48, a4, a7, v68 + v71, v42, v78 + a6, v42, v77 + a6, v42, v79 + a6, v42, v76 + a6, a7,
    v70,
    a7,
    v49,
    a7,
    v47,
    a7,
    v43,
    a7,
    v46,
    a7,
    v53,
    a7,
    v45,
    a7,
    v44,
    v75);
  -[MTLGPUBVHBuilder writeBVHHeaderWithEncoder:descriptor:tmpCounterBuffer:tmpCounterBufferOffset:nodeBuffer:nodeBufferOffset:headerBuffer:headerBufferOffset:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:size:](v50, "writeBVHHeaderWithEncoder:descriptor:tmpCounterBuffer:tmpCounterBufferOffset:nodeBuffer:nodeBufferOffset:headerBuffer:headerBufferOffset:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:size:", v48, a4, a7, v70, v42, v79 + a6, v42, a6, v79, v78, v77, v76, v73);
}

- (void)buildGenericBVHWithEncoder:(id)a3 descriptor:(id)a4 outputBuffer:(id)a5 outputBufferOffset:(unint64_t)a6 scratchBuffer:(id)a7 scratchBufferOffset:(unint64_t)a8
{
  -[MTLGPUBVHBuilder buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:](self, "buildGenericBVHWithEncoder:descriptor:outputBuffer:outputBufferOffset:scratchBuffer:scratchBufferOffset:primitiveCountBuffer:primitiveCountBufferOffset:", a3, a4, a5, a6, a7, a8, 0, 0);
}

+ (unint64_t)prefixSumScratchBufferSizeWithCapacity:(unint64_t)a3
{
  uint64_t v3;
  unint64_t v4;

  if (a3 < 0x201)
    return 0;
  v3 = 0;
  do
  {
    v4 = a3 + 511;
    a3 = (a3 + 511) >> 9;
    v3 += v4 >> 9;
  }
  while (a3 > 0x200);
  return 4 * v3;
}

- (void)threadgroupPrefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  unint64_t v14;
  id v15;
  int *v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  int64x2_t v21;
  int v22;
  _BYTE v23[20];
  __int128 v24;

  if (a6)
    v14 = a7;
  else
    v14 = a5;
  if (a6)
    v15 = a6;
  else
    v15 = a4;
  v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_PREFIX_SUM_REDUCE;
  if (!a6)
    v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_PREFIX_SUM;
  v17 = *((unsigned __int8 *)&self->super.super.isa + *v16);
  *(_OWORD *)&v23[4] = 0u;
  v24 = 0u;
  v22 = v17;
  *(_QWORD *)v23 = 57344;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v22));
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 28);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v15, v14, 29);
  if (a8)
  {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 30);
  }
  else
  {
    v22 = a10;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v22, 4, 30);
  }
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v20 = (a10 + 511) >> 9;
  v21 = vdupq_n_s64(1uLL);
  v18 = xmmword_1827FE440;
  v19 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v20, &v18);
}

- (void)addPrefixSumsWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 countBuffer:(id)a8 countBufferOffset:(unint64_t)a9 capacity:(unint64_t)a10
{
  int KERNEL_INDEX_PREFIX_SUM_ADD_low;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  int64x2_t v20;
  int v21;
  _BYTE v22[20];
  __int128 v23;

  KERNEL_INDEX_PREFIX_SUM_ADD_low = LOBYTE(self->KERNEL_INDEX_PREFIX_SUM_ADD);
  *(_OWORD *)&v22[4] = 0u;
  v23 = 0u;
  v21 = KERNEL_INDEX_PREFIX_SUM_ADD_low;
  *(_QWORD *)v22 = 57344;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v21));
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 28);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 29);
  if (a8)
  {
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 30);
  }
  else
  {
    v21 = a10;
    objc_msgSend(a3, "setBytes:length:atIndex:", &v21, 4, 30);
  }
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v19 = (a10 + 511) >> 9;
  v20 = vdupq_n_s64(1uLL);
  v17 = xmmword_1827FE440;
  v18 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
}

- (void)prefixSumWithEncoder:(id)a3 inputBuffer:(id)a4 inputBufferOffset:(unint64_t)a5 reducedBuffer:(id)a6 reducedBufferOffset:(unint64_t)a7 scratchBuffer:(id)a8 scratchBufferOffset:(unint64_t)a9 countBuffer:(id)a10 countBufferOffset:(unint64_t)a11 capacity:(unint64_t)a12
{
  if (a12)
  {
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    if (a12 > 0x200)
    {
      -[MTLGPUBVHBuilder threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a8, a9, a10, a11, a12);
      -[MTLGPUBVHBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](self, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a8, a9, a6, a7, a8, a9 + 4 * ((a12 + 511) >> 9), 0, 0, (a12 + 511) >> 9);
      -[MTLGPUBVHBuilder addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "addPrefixSumsWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a8, a9, a10);
    }
    else
    {
      -[MTLGPUBVHBuilder threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:](self, "threadgroupPrefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a4, a5, a6, a7, a10);
    }
  }
}

+ (unint64_t)breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:(unint64_t)a3
{
  return +[MTLGPUBVHBuilder prefixSumScratchBufferSizeWithCapacity:](MTLGPUBVHBuilder, "prefixSumScratchBufferSizeWithCapacity:")+ 16 * a3;
}

- (void)layoutNodesBreadthFirstWithEncoder:(id)a3 descriptor:(id)a4 BVHBuffer:(id)a5 BVHBufferOffset:(unint64_t)a6 counterBuffer:(id)a7 counterBufferOffset:(unint64_t)a8 nodeMappingBuffer:(id)a9 nodeMappingBufferOffset:(unint64_t)a10 levelOffsetsBuffer:(id)a11 levelOffsetsBufferOffset:(unint64_t)a12 levelCountsBuffer:(id)a13 levelCountsBufferOffset:(unint64_t)a14 scratchBuffer:(id)a15 scratchBufferOffset:(unint64_t)a16
{
  unint64_t v21;
  unint64_t v22;
  PipelineCache<PipelineKey> *p_pipelineCache;
  void *Pipeline;
  void *v25;
  unint64_t v26;
  double v27;
  double v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  MTLGPUBVHBuilder *v47;
  id v48;
  uint64_t v49;
  int64x2_t v50;
  int64x2_t v51;
  uint64_t v52;
  unint64_t v53;
  int64x2_t v54;
  unint64_t v55;
  int64x2_t v56;
  unint64_t v57;
  int64x2_t v58;
  unint64_t v59;
  int64x2_t v60;
  unint64_t v61;
  int64x2_t v62;
  int64x2_t v63;
  uint64_t v64;
  int v65;
  uint64_t threadgroupSize;
  int64x2_t v67;
  int64x2_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77[3];

  v76 = 0;
  v77[0] = 0;
  v74 = 0;
  v75 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a4, v77, &v76, &v75, &v74);
  v72 = 0;
  v73 = 0;
  v70 = 0;
  v71 = 0;
  -[MTLGPUBVHBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:](self, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:", a4, &v73, &v72, &v71, &v70);
  v44 = +[MTLGPUBVHBuilder prefixSumScratchBufferSizeWithCapacity:](MTLGPUBVHBuilder, "prefixSumScratchBufferSizeWithCapacity:", v75)+ a16;
  v39 = v44 + 4 * v75;
  v21 = v39 + 4 * v75;
  v22 = v21 + 4 * v75;
  p_pipelineCache = &self->_pipelineCache;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((unsigned __int8 *)&self->_pipelineCache, self->KERNEL_INDEX_THREADGROUP_BREADTH_FIRST_LAYOUT, a4, self->_maxThreadsPerThreadgroup.width);
  v47 = self;
  v48 = a4;
  v25 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_INIT, a4);
  v26 = objc_msgSend(Pipeline, "maxTotalThreadsPerThreadgroup");
  v27 = log2((double)v75);
  v41 = 0;
  v42 = 0;
  v40 = 0;
  v43 = v26;
  if (v26 < (unint64_t)exp2(ceil(v27)))
  {
    v42 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, v47->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_FINISH_ITERATION, v48);
    v41 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, v47->KERNEL_INDEX_BREADTH_FIRST_LAYOUT_CLASSIFY, v48);
    v40 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, v47->KERNEL_INDEX_BREADTH_FIRST_LAYOUT, v48);
  }
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, v21, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, v22, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, v44, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, v39, 3);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v73 + a6, 4);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, v70 + a6, 5);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, a8, 6);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a9, a10, 7);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a11, a12, 8);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a13, a14, 9);
  objc_msgSend(a3, "setComputePipelineState:", v25);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v67 = vdupq_n_s64(1uLL);
  v68 = v67;
  v69 = 1;
  threadgroupSize = v47->_threadgroupSize;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v68, &threadgroupSize);
  v28 = log2((double)(unint64_t)objc_msgSend(v48, "branchingFactor"));
  if (objc_msgSend(v48, "maxDepth"))
  {
    v29 = 0;
    v30 = 0;
    do
    {
      v31 = v22;
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, v21, 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a15, v22, 1);
      v65 = v30;
      objc_msgSend(a3, "setBytes:length:atIndex:", &v65, 4, 10);
      if (1 << v29 >= v75)
        v32 = v75;
      else
        v32 = 1 << v29;
      v33 = log2((double)(unint64_t)v32);
      v34 = (unint64_t)exp2(ceil(v33));
      if (v26 >= v34)
      {
        objc_msgSend(a3, "setComputePipelineState:", Pipeline);
        v37 = objc_msgSend(v48, "branchingFactor");
        v38 = 2;
        if (v37 != 2)
          v38 = 3;
        objc_msgSend(a3, "setThreadgroupMemoryLength:atIndex:", ((v34 << v38) + 15) & 0xFFFFFFFFFFFFFFF0, 0);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v62 = vdupq_n_s64(1uLL);
        v63 = v62;
        v64 = 1;
        v61 = v34;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v63, &v61);
      }
      else
      {
        objc_msgSend(a3, "setComputePipelineState:", v41);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v35 = v47->_threadgroupSize;
        v59 = (v32 - 1 + v35) / v35;
        v60 = vdupq_n_s64(1uLL);
        v57 = v35;
        v58 = v60;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v59, &v57);
        -[MTLGPUBVHBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](v47, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a15, v44, 0, 0, a15, a16, a7, a8, v32);
        if (objc_msgSend(v48, "branchingFactor") != 2)
          -[MTLGPUBVHBuilder prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:](v47, "prefixSumWithEncoder:inputBuffer:inputBufferOffset:reducedBuffer:reducedBufferOffset:scratchBuffer:scratchBufferOffset:countBuffer:countBufferOffset:capacity:", a3, a15, v39, 0, 0, a15, a16, a7, a8, v32);
        objc_msgSend(a3, "setComputePipelineState:", v40);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v36 = v47->_threadgroupSize;
        v55 = (v32 - 1 + v36) / v36;
        v56 = vdupq_n_s64(1uLL);
        v53 = v36;
        v54 = v56;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v55, &v53);
        objc_msgSend(a3, "setComputePipelineState:", v42);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v50 = vdupq_n_s64(1uLL);
        v51 = v50;
        v52 = 1;
        v49 = v47->_threadgroupSize;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v51, &v49);
        v26 = v43;
      }
      ++v30;
      v29 += (unint64_t)v28;
      v22 = v21;
      v21 = v31;
    }
    while (v30 < objc_msgSend(v48, "maxDepth"));
  }
}

- (unint64_t)getEncodeMTLSWBVHScratchBufferSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a4, &v12, &v11, &v10, &v9);
  v5 = (((((4 * (v11 + v10) + 255) & 0xFFFFFFFFFFFFFF00) + 3071) & 0xFFFFFFFFFFFFFF00) + 1023) & 0xFFFFFFFFFFFFFF00;
  v6 = (+[MTLGPUBVHBuilder breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:](MTLGPUBVHBuilder, "breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:")+ v5+ 255) & 0xFFFFFFFFFFFFFF00;
  v7 = (v6 + 4 * objc_msgSend(a4, "maxDepth") + 255) & 0xFFFFFFFFFFFFFF00;
  return v7 + 4 * objc_msgSend(a4, "maxDepth");
}

- ($D4F0DBFB58BF58C1D2D6E8FF21CEAEC6)getMTLSWBVHSizeAndOffsetsForDescriptor:(SEL)a3 bvhDescriptor:(id)a4
{
  int MTLSWBVHType;
  unsigned int MTLSWBVHPrimitiveType;
  _BOOL4 MTLSWBVHMotion;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  $D4F0DBFB58BF58C1D2D6E8FF21CEAEC6 *result;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var10 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType((MTLAccelerationStructureDescriptor *)a4);
  MTLSWBVHMotion = getMTLSWBVHMotion((MTLAccelerationStructureDescriptor *)a4);
  v12 = MTLSWBVHMotion;
  if (MTLSWBVHType)
    v13 = 44;
  else
    v13 = 16;
  if (MTLSWBVHType)
  {
    v14 = 0;
  }
  else
  {
    if (MTLSWBVHPrimitiveType > 2)
      v14 = 0;
    else
      v14 = *(_QWORD *)&a0_0[8 * MTLSWBVHPrimitiveType];
    if (MTLSWBVHPrimitiveType - 1 >= 2 && !MTLSWBVHPrimitiveType)
    {
      v44 = 8;
      goto LABEL_13;
    }
  }
  v44 = 0;
LABEL_13:
  v15 = 64;
  if (MTLSWBVHMotion)
    v15 = 124;
  v43 = v15;
  if (objc_msgSend(a5, "primitiveMotion"))
    v14 *= objc_msgSend(a5, "primitiveKeyframeCount");
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:fragmentIndexCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a5, &v53, &v49, &v52, &v51, &v50);
  if (MTLSWBVHType)
  {
    v16 = (void *)objc_opt_class();
    if (objc_msgSend(v16, "isSubclassOfClass:", objc_opt_class()))
    {
      v17 = objc_msgSend(a4, "instanceCount");
      if (v12)
      {
        v18 = objc_msgSend(a4, "motionTransformCount");
LABEL_33:
        v27 = v18;
LABEL_38:
        v23 = 0;
        v28 = 255;
        goto LABEL_39;
      }
    }
    else
    {
      v26 = (void *)objc_opt_class();
      if (!objc_msgSend(v26, "isSubclassOfClass:", objc_opt_class()))
      {
        v17 = 0;
        v27 = 0;
        goto LABEL_38;
      }
      v17 = objc_msgSend(a4, "maxInstanceCount");
      if (v12)
      {
        v18 = objc_msgSend(a4, "maxMotionTransformCount");
        goto LABEL_33;
      }
    }
    v23 = 0;
    v28 = 255;
    v27 = v17;
    goto LABEL_39;
  }
  v19 = objc_msgSend((id)objc_msgSend(a4, "geometryDescriptors"), "count");
  v42 = v13;
  if (MTLSWBVHPrimitiveType == 2
    && (v47 = 0u,
        v48 = 0u,
        v45 = 0u,
        v46 = 0u,
        v20 = (void *)objc_msgSend(a5, "geometryDescriptors"),
        (v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v54, 16)) != 0))
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v20);
        v23 += objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "controlPointCount");
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }
  v17 = 0;
  v27 = 0;
  v28 = 8 * v19 + 255;
  v13 = v42;
LABEL_39:
  v29 = 256;
  retstr->var1 = 256;
  if ((objc_msgSend(a4, "usage") & 1) != 0)
    v29 = (8 * objc_msgSend(a5, "maxDepth") + 511) & 0xFFFFFFFFFFFFFF00;
  v30 = ((v29 | 0xFC) + v43 + v43 * v52) & 0xFFFFFFFFFFFFFF00;
  retstr->var2 = v29;
  retstr->var3 = v30;
  v31 = (v30 + v51 * v13 + 255) & 0xFFFFFFFFFFFFFF00;
  v32 = v31 + v49 * v14 + 255;
  retstr->var4 = v31;
  retstr->var5 = v32 & 0xFFFFFFFFFFFFFF00;
  if (objc_msgSend(a5, "motion"))
    v33 = objc_msgSend(a5, "primitiveKeyframeCount");
  else
    v33 = 1;
  v34 = (v32 | 0xF0) + 16 * v23 * v33;
  retstr->var6 = v34 & 0xFFFFFFFFFFFFFF00;
  result = ($D4F0DBFB58BF58C1D2D6E8FF21CEAEC6 *)objc_msgSend(a4, "usage");
  v36 = ((v34 | 0xF8) + (((uint64_t)((_QWORD)result << 63) >> 63) & (v49 * v44))) & 0xFFFFFFFFFFFFFF00;
  v37 = (v28 + v36) & 0xFFFFFFFFFFFFFF00;
  retstr->var7 = v36;
  retstr->var8 = v37;
  v38 = 8 * v17 + 255;
  v39 = (v38 + v37) & 0xFFFFFFFFFFFFFF00;
  v40 = (v39 + (v27 << 7) + 255) & 0xFFFFFFFFFFFFFF00;
  retstr->var9 = v39;
  retstr->var10 = v40;
  v41 = (v50 + v40 + 255) & 0xFFFFFFFFFFFFFF00;
  retstr->var11 = v41;
  retstr->var0 = (v38 + v41) & 0xFFFFFFFFFFFFFF00;
  return result;
}

- (unint64_t)getMTLSWBVHSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4 refitDataOffset:(unint64_t *)a5 innerNodeOffset:(unint64_t *)a6 leafNodeOffset:(unint64_t *)a7 primitiveOffset:(unint64_t *)a8 controlPointOffset:(unint64_t *)a9 primitiveRefitDataOffset:(unint64_t *)a10 geometryOffset:(unint64_t *)a11 primitiveBVHOffset:(unint64_t *)a12 transformOffset:(unint64_t *)a13 instancedResourceIDsOffset:(unint64_t *)a14
{
  if (self)
  {
    objc_msgSend((id)self, "getMTLSWBVHSizeAndOffsetsForDescriptor:bvhDescriptor:", a3, a4);
    self = 0;
  }
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  *a12 = 0;
  *a13 = 0;
  *a14 = 0;
  return self;
}

- (unint64_t)getMTLSWBVHSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4
{
  unint64_t v4;

  if (self)
  {
    objc_msgSend((id)self, "getMTLSWBVHSizeAndOffsetsForDescriptor:bvhDescriptor:", a3, a4);
    return v4;
  }
  return self;
}

- (id)newGeometryBufferWithGeometryDescriptors:(id)a3 retainedResources:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  void *v13;

  v7 = objc_msgSend(a3, "count");
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  v9 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8 * v8, 0);
  v10 = objc_msgSend(v9, "contents");
  if (v7)
  {
    v11 = 0;
    v12 = (_DWORD *)(v10 + 4);
    do
    {
      v13 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v11);
      *(v12 - 1) = objc_msgSend(v13, "opaque");
      *v12 = objc_msgSend(v13, "intersectionFunctionTableOffset");
      v12 += 2;
      ++v11;
    }
    while (v7 != v11);
  }
  objc_msgSend(a4, "addObject:", v9);
  return v9;
}

- (void)setGeometryBufferWithGeometryDescriptors:(id)a3 retainedResources:(id)a4 onEncoder:(id)a5 atIndex:(unint64_t)a6
{
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  _DWORD *v15;
  void *v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a3, "count");
  v12 = v11;
  if (v11 >= 0x11)
  {
    v17[0] = (id)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8 * v11, 0);
    v13 = (char *)objc_msgSend(v17[0], "contents");
  }
  else
  {
    v13 = (char *)v17 - ((8 * v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, 8 * v11);
    if (!v12)
      goto LABEL_9;
    v17[0] = 0;
  }
  v14 = 0;
  v15 = v13 + 4;
  do
  {
    v16 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v14, v17[0]);
    *(v15 - 1) = objc_msgSend(v16, "opaque");
    *v15 = objc_msgSend(v16, "intersectionFunctionTableOffset");
    v15 += 2;
    ++v14;
  }
  while (v12 != v14);
  if (v17[0])
  {
    objc_msgSend(a4, "addObject:", v17[0]);

    return;
  }
LABEL_9:
  objc_msgSend(a5, "setBytes:length:atIndex:", v13, 8 * v12, a6);
}

- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 gpuResourceID:(MTLResourceID)a12 accelerationStructureUniqueIdentifier:(unint64_t)a13
{
  MTLGPUBVHBuilder *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int MTLSWBVHType;
  int MTLSWBVHPrimitiveType;
  void *Pipeline;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  int *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t n;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  void *v64;
  _BOOL4 v65;
  unsigned int v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT;
  int v83;
  char v84;
  int v85;
  char v86;
  int v87;
  char v88;
  char v89;
  int v90;
  int v91;
  int v92;
  char v93;
  char v94;
  uint64_t threadgroupSize;
  unsigned int v96;
  unsigned int KERNEL_INDEX_COPY_COUNTERS_low;
  void *v98;
  MTLGPUBVHBuilder *v99;
  uint64_t v100;
  MTLGPUBVHBuilder *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *ii;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unsigned int v118;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  id v122;
  MTLGPUBVHBuilder *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  _BOOL4 MTLSWBVHMotion;
  unint64_t v129;
  unint64_t v130;
  void *v131;
  void *v132;
  uint64_t v135;
  uint64_t v136;
  id v137;
  uint64_t p_pipelineCache;
  unint64_t v140;
  int v141;
  id v142;
  unint64_t v143;
  id v144;
  id obj;
  id obja;
  uint64_t v147;
  int v148;
  int64x2_t v149;
  uint64_t v150;
  int64x2_t v151;
  uint64_t v152;
  int64x2_t v153;
  uint64_t v154;
  int64x2_t v155;
  uint64_t v156;
  int64x2_t v157;
  int v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t v163;
  int64x2_t v164;
  uint64_t v165;
  int64x2_t v166;
  uint64_t v167;
  int64x2_t v168;
  uint64_t v169;
  int64x2_t v170;
  __int128 v171;
  uint64_t v172;
  uint64_t v173;
  _QWORD v174[2];
  int v175;
  unsigned int v176;
  uint64_t v177;
  int v178;
  unsigned int v179;
  uint64_t v180;
  int64x2_t v181;
  int64x2_t v182;
  uint64_t v183;
  uint64_t v184;
  int64x2_t v185;
  int64x2_t v186;
  uint64_t v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  uint64_t v195;
  uint64_t v196;
  __int128 v197;
  __int128 v198;
  uint64_t v199;
  uint64_t v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  uint64_t v226;
  _QWORD v227[11];
  __int128 v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  unsigned int v237;
  _BYTE v238[20];
  __int128 v239;
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  uint64_t v246;

  v16 = self;
  v246 = *MEMORY[0x1E0C80C00];
  v137 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  v236 = 0;
  v235 = 0;
  v234 = 0;
  v233 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](v16, "getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a5, &v236, &v235, &v234, &v233);
  v232 = 0;
  v231 = 0;
  v230 = 0;
  v229 = 0;
  -[MTLGPUBVHBuilder getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:](v16, "getGenericBVHSizeForDescriptor:nodeOffset:fragmentOffset:fragmentIndexOffset:childIndexOffset:", a5, &v232, &v231, &v230, &v229);
  v228 = 0u;
  memset(&v227[1], 0, 80);
  if (v16)
    -[MTLGPUBVHBuilder getMTLSWBVHSizeAndOffsetsForDescriptor:bvhDescriptor:](v16, "getMTLSWBVHSizeAndOffsetsForDescriptor:bvhDescriptor:", a4, a5);
  v17 = (((a11 + 255) | 0xFC) + 4 * (v235 + v234)) & 0xFFFFFFFFFFFFFF00;
  v143 = (v17 + 3071) & 0xFFFFFFFFFFFFFF00;
  v18 = (+[MTLGPUBVHBuilder breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:](MTLGPUBVHBuilder, "breadthFirstLayoutScratchBufferSizeWithLeafNodeCapacity:")+ ((v143 + 1023) & 0xFFFFFFFFFFFFFF00)+ 255) & 0xFFFFFFFFFFFFFF00;
  v144 = a5;
  v19 = (v18 + 4 * objc_msgSend(a5, "maxDepth") + 255) & 0xFFFFFFFFFFFFFF00;
  objc_msgSend(v144, "maxDepth");
  objc_msgSend(v144, "updatePipelineKey");
  v129 = v18;
  v122 = a10;
  v130 = v19;
  v140 = v17;
  -[MTLGPUBVHBuilder layoutNodesBreadthFirstWithEncoder:descriptor:BVHBuffer:BVHBufferOffset:counterBuffer:counterBufferOffset:nodeMappingBuffer:nodeMappingBufferOffset:levelOffsetsBuffer:levelOffsetsBufferOffset:levelCountsBuffer:levelCountsBufferOffset:scratchBuffer:scratchBufferOffset:](v16, "layoutNodesBreadthFirstWithEncoder:descriptor:BVHBuffer:BVHBufferOffset:counterBuffer:counterBufferOffset:nodeMappingBuffer:nodeMappingBufferOffset:levelOffsetsBuffer:levelOffsetsBufferOffset:levelCountsBuffer:levelCountsBufferOffset:scratchBuffer:scratchBufferOffset:", a3, v144, a8, a9);
  MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType((MTLAccelerationStructureDescriptor *)a4);
  MTLSWBVHMotion = getMTLSWBVHMotion((MTLAccelerationStructureDescriptor *)a4);
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_BVH_NODE0, v144);
  v227[0] = 0;
  v226 = 0;
  v142 = a4;
  p_pipelineCache = (uint64_t)&v16->_pipelineCache;
  v148 = MTLSWBVHPrimitiveType;
  v141 = MTLSWBVHType;
  if (!MTLSWBVHType)
  {
    v29 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH, v144);
    v30 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_PRIMITIVE_BVH_INNER_NODE, v144);
    v31 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_LEAF_NODE;
    if (MTLSWBVHPrimitiveType == 1)
      v31 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_ENCODE_MTL_BBOX_BVH_LEAF_NODE;
    if (!MTLSWBVHPrimitiveType)
      v31 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_ENCODE_MTL_TRIANGLE_BVH_LEAF_NODE;
    v126 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, *(_DWORD *)((char *)&v16->super.super.isa + *v31), v144);
    obj = (id)objc_msgSend(v144, "geometryDescriptors");
    v135 = objc_msgSend(obj, "count");
    v123 = v16;
    v125 = Pipeline;
    v131 = v29;
    v132 = v30;
    if (v135)
    {
      v32 = MTLSWBVHPrimitiveType;
      if ((objc_msgSend(v144, "requiresResourceBuffer") & 1) != 0)
      {
        v224 = 0u;
        v225 = 0u;
        v222 = 0u;
        v223 = 0u;
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v222, v245, 16);
        if (v33)
        {
          v34 = v33;
          v147 = 0;
          v35 = *(_QWORD *)v223;
          while (1)
          {
            for (i = 0; i != v34; ++i)
            {
              if (*(_QWORD *)v223 != v35)
                objc_enumerationMutation(obj);
              v37 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * i);
              if (v32)
              {
                if (v32 == 1)
                {
                  v216 = 0uLL;
                  v217 = 0uLL;
                  v214 = 0uLL;
                  v215 = 0uLL;
                  v38 = (void *)objc_msgSend(v37, "boundingBoxBuffers");
                  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v214, v243, 16);
                  if (!v39)
                    goto LABEL_56;
                  v40 = v39;
                  v41 = *(_QWORD *)v215;
                  do
                  {
                    for (j = 0; j != v40; ++j)
                    {
                      if (*(_QWORD *)v215 != v41)
                        objc_enumerationMutation(v38);
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v214 + 1) + 8 * j), "buffer"), 1);
                    }
                    v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v214, v243, 16);
                  }
                  while (v40);
                }
                else
                {
                  v212 = 0uLL;
                  v213 = 0uLL;
                  v210 = 0uLL;
                  v211 = 0uLL;
                  v48 = (void *)objc_msgSend(v37, "controlPointBuffers");
                  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v210, v242, 16);
                  if (v49)
                  {
                    v50 = v49;
                    v51 = *(_QWORD *)v211;
                    do
                    {
                      for (k = 0; k != v50; ++k)
                      {
                        if (*(_QWORD *)v211 != v51)
                          objc_enumerationMutation(v48);
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v210 + 1) + 8 * k), "buffer"), 1);
                      }
                      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v210, v242, 16);
                    }
                    while (v50);
                  }
                  v208 = 0u;
                  v209 = 0u;
                  v206 = 0u;
                  v207 = 0u;
                  v53 = (void *)objc_msgSend(v37, "radiusBuffers");
                  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v206, v241, 16);
                  if (v54)
                  {
                    v55 = v54;
                    v56 = *(_QWORD *)v207;
                    do
                    {
                      for (m = 0; m != v55; ++m)
                      {
                        if (*(_QWORD *)v207 != v56)
                          objc_enumerationMutation(v53);
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v206 + 1) + 8 * m), "buffer"), 1);
                      }
                      v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v206, v241, 16);
                    }
                    while (v55);
                  }
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "indexBuffer"), 1);
                  v147 += objc_msgSend(v37, "controlPointCount");
                }
              }
              else
              {
                v220 = 0uLL;
                v221 = 0uLL;
                v218 = 0uLL;
                v219 = 0uLL;
                v43 = (void *)objc_msgSend(v37, "vertexBuffers");
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v218, v244, 16);
                if (v44)
                {
                  v45 = v44;
                  v46 = *(_QWORD *)v219;
                  do
                  {
                    for (n = 0; n != v45; ++n)
                    {
                      if (*(_QWORD *)v219 != v46)
                        objc_enumerationMutation(v43);
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v218 + 1) + 8 * n), "buffer"), 1);
                    }
                    v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v218, v244, 16);
                  }
                  while (v45);
                }
                if (objc_msgSend(v37, "indexBuffer"))
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "indexBuffer"), 1);
                if (objc_msgSend(v37, "transformationMatrixBuffer"))
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "transformationMatrixBuffer"), 1);
              }
              v32 = v148;
LABEL_56:
              if (objc_msgSend(v37, "primitiveDataBuffer"))
                objc_msgSend(a3, "useResource:usage:", objc_msgSend(v37, "primitiveDataBuffer"), 1);
            }
            v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v222, v245, 16);
            if (!v34)
            {
LABEL_69:
              a4 = v142;
              v16 = v123;
              v127 = -[MTLGPUBVHBuilder newGeometryBufferWithGeometryDescriptors:retainedResources:](v123, "newGeometryBufferWithGeometryDescriptors:retainedResources:", objc_msgSend(v142, "geometryDescriptors"), v137);
              v62 = 0;
              v65 = 0;
              v66 = 0;
              obja = 0;
              v64 = v144;
              Pipeline = v125;
              v67 = v135;
              v63 = v147;
              goto LABEL_94;
            }
          }
        }
      }
      else if (!MTLSWBVHPrimitiveType)
      {
        v68 = (void *)objc_msgSend(obj, "objectAtIndexedSubscript:", 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v68, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 5);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v68, "indexBuffer"), objc_msgSend(v68, "indexBufferOffset"), 6);
      }
    }
    LODWORD(v147) = 0;
    goto LABEL_69;
  }
  v23 = (void *)objc_opt_class();
  if (objc_msgSend(v23, "isSubclassOfClass:", objc_opt_class()))
  {
    v124 = Pipeline;
    v24 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH, v144);
    v25 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_INNER_NODE, v144);
    v26 = objc_msgSend(a4, "instanceDescriptorType");
    v27 = v26;
    v131 = v24;
    v132 = v25;
    if (v26 == 4 || v26 == 2)
      v28 = objc_msgSend(a4, "motionTransformCount");
    else
      v28 = objc_msgSend(a4, "instanceCount");
    v62 = v28;
    v237 = 3;
    v69 = objc_msgSend(a4, "instanceTransformationMatrixLayout");
    v237 = v237 & 0xFFFFFFEF | (16 * (v69 == 1));
    v65 = objc_msgSend(a4, "instanceTransformationMatrixLayout") == 1;
    v66 = objc_msgSend(a4, "motionTransformType");
    switch(v27)
    {
      case 0:
      case 2:
        v74 = 308;
        goto LABEL_79;
      case 1:
        v74 = 312;
        goto LABEL_79;
      case 3:
      case 4:
        v74 = 316;
LABEL_79:
        v83 = *(_DWORD *)((char *)&v16->super.super.isa + v74);
        *(_QWORD *)&v190 = 0;
        v189 = 0u;
        v188 = 0u;
        PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&v16->_pipelineCache, v83, v144, v16->_pipelineCache.baseThreadgroupSize, &v237, (uint64_t)&v188);
        v126 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, (uint64_t)&v188, 0);
        break;
      default:
        MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6590, (uint64_t)CFSTR("Unhandled instance descriptor type"), v70, v71, v72, v73, (uint64_t)a10);
        v126 = 0;
        break;
    }
    objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 8);
    LODWORD(v226) = objc_msgSend(a4, "instanceDescriptorStride");
    obja = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:](v16, "newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:", objc_msgSend(a4, "instancedAccelerationStructures"), v137, a3, v227);
    objc_msgSend(a3, "setBuffer:offset:atIndex:");
    if (v27 == 4 || v27 == 2)
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 11);
    v84 = objc_msgSend(a4, "usage");
    v63 = 0;
    v67 = 0;
    v127 = 0;
    if ((v84 & 4) != 0)
      v85 = -1;
    else
      v85 = 255;
    HIDWORD(v226) = v85;
    v64 = v144;
    Pipeline = v124;
  }
  else
  {
    v58 = (void *)objc_opt_class();
    if (objc_msgSend(v58, "isSubclassOfClass:", objc_opt_class()))
    {
      v59 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH, v144);
      v60 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&v16->_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_INNER_NODE, v144);
      v61 = objc_msgSend(a4, "instanceDescriptorType");
      v131 = v59;
      v132 = v60;
      if (v61 == 4)
        v75 = objc_msgSend(a4, "maxMotionTransformCount");
      else
        v75 = objc_msgSend(a4, "maxInstanceCount");
      v76 = v75;
      v237 = 3;
      v77 = objc_msgSend(a4, "instanceTransformationMatrixLayout");
      v237 = v237 & 0xFFFFFFEF | (16 * (v77 == 1));
      v65 = objc_msgSend(a4, "instanceTransformationMatrixLayout") == 1;
      v66 = objc_msgSend(a4, "motionTransformType");
      if (v61 == 3 || v61 == 4)
      {
        KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT = v16->KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT;
        *(_QWORD *)&v190 = 0;
        v189 = 0u;
        v188 = 0u;
        PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&v16->_pipelineCache, KERNEL_INDEX_ENCODE_MTL_INSTANCE_BVH_LEAF_NODE_INDIRECT, v144, v16->_pipelineCache.baseThreadgroupSize, &v237, (uint64_t)&v188);
        v126 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, (uint64_t)&v188, 0);
      }
      else
      {
        MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6652, (uint64_t)CFSTR("Unhandled instance descriptor type"), v78, v79, v80, v81, (uint64_t)a10);
        v126 = 0;
      }
      v62 = v76;
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 8);
      LODWORD(v226) = objc_msgSend(a4, "instanceDescriptorStride");
      obja = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:](v16, "newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:", 0, v137, a3, v227);
      objc_msgSend(a3, "setBuffer:offset:atIndex:");
      if (objc_msgSend(a4, "instanceDescriptorType") == 4)
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 11);
      v86 = objc_msgSend(a4, "usage");
      v63 = 0;
      v67 = 0;
      v127 = 0;
      if ((v86 & 4) != 0)
        v87 = -1;
      else
        v87 = 255;
      HIDWORD(v226) = v87;
      v64 = v144;
    }
    else
    {
      v62 = 0;
      v63 = 0;
      v64 = v144;
      v65 = 0;
      v66 = 0;
      v67 = 0;
      v126 = 0;
      v127 = 0;
      obja = 0;
      v131 = 0;
      v132 = 0;
    }
  }
LABEL_94:
  v204 = 0u;
  v205 = 0u;
  v202 = 0u;
  v203 = 0u;
  v201 = 0u;
  v197 = 0u;
  v198 = 0u;
  v188 = 0u;
  *(_QWORD *)&v189 = 0;
  v190 = 0u;
  v191 = *(_OWORD *)&v227[2];
  v192 = *(_OWORD *)&v227[4];
  v193 = *(_OWORD *)&v227[6];
  v194 = *(_OWORD *)&v227[8];
  HIDWORD(v190) = v227[0];
  v195 = v227[10];
  v196 = v227[1];
  *((_QWORD *)&v189 + 1) = __PAIR64__(v67, v63);
  LODWORD(v188) = (2 * (v148 & 3)) | v141;
  v136 = v67;
  DWORD1(v190) = v62;
  *(_QWORD *)&v197 = a13;
  *(_QWORD *)&v202 = *((_QWORD *)&v228 + 1);
  v199 = v228;
  v200 = v233;
  v88 = objc_msgSend(v64, "maxDepth");
  LODWORD(v188) = v188 & 0xFFFF80FF | ((v88 & 0x7F) << 8);
  v89 = objc_msgSend(a4, "usage");
  if (MTLSWBVHMotion)
    v90 = 8;
  else
    v90 = 0;
  LODWORD(v188) = v188 & 0xFFFFFFE7 | v90 & 0xFFFFFFEF | (16 * (v89 & 1));
  *((_QWORD *)&v205 + 1) = __PAIR64__(v66, v65);
  if (!v141)
  {
    DWORD2(v190) = objc_msgSend(v142, "motionKeyframeCount");
    objc_msgSend(v142, "motionStartTime");
    DWORD1(v188) = v91;
    objc_msgSend(v142, "motionEndTime");
    DWORD2(v188) = v92;
    v93 = objc_msgSend(v142, "motionStartBorderMode");
    LODWORD(v188) = v188 & 0xFFFFFFDF | (32 * (v93 & 1));
    v94 = objc_msgSend(v142, "motionEndBorderMode");
    LODWORD(v188) = v188 & 0xFFFFFFBF | ((v94 & 1) << 6);
  }
  objc_msgSend(a3, "setBytes:length:atIndex:", &v226, 8, 0);
  objc_msgSend(a3, "setBytes:length:atIndex:", &v188, 256, 9);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 2);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a10, (a11 + 255) & 0xFFFFFFFFFFFFFF00, 3);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a10, v140, 4);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, (_QWORD)v228 + a7, 12);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a10, v129, 13);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a10, v130, 14);
  threadgroupSize = v16->_threadgroupSize;
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v186 = vdupq_n_s64(1uLL);
  v187 = 1;
  v184 = threadgroupSize;
  v185 = v186;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v186, &v184);
  if (v233)
  {
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, v16->KERNEL_INDEX_ENCODE_PRIMITIVE_DATA, v144));
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    v181 = vdupq_n_s64(1uLL);
    v182 = v181;
    v183 = 1;
    v180 = threadgroupSize;
    objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v182, &v180);
  }
  v174[0] = objc_msgSend(a10, "gpuAddress") + v140;
  v174[1] = objc_msgSend(a10, "gpuAddress") + v143;
  v96 = v16->_threadgroupSize;
  v175 = 1536;
  v176 = v96;
  v177 = 0x101000900;
  v178 = 33556480;
  v179 = v96;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v173 = 0;
  KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(v16->KERNEL_INDEX_COPY_COUNTERS);
  *(_OWORD *)&v238[4] = 0u;
  v239 = 0u;
  v237 = KERNEL_INDEX_COPY_COUNTERS_low;
  *(_QWORD *)v238 = (log2((double)*(unint64_t *)(p_pipelineCache + 40)) & 0xF) << 13;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, (uint64_t)&v237, &v173));
  objc_msgSend(a3, "setBytes:length:atIndex:", v174, 40, 30);
  v172 = 1;
  v169 = v173;
  v170 = vdupq_n_s64(1uLL);
  v171 = xmmword_1827FE450;
  objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v171, &v169);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  objc_msgSend(a3, "setComputePipelineState:", v131);
  v167 = v16->_threadgroupSize;
  v168 = vdupq_n_s64(1uLL);
  objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a10, v143, &v167);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  objc_msgSend(a3, "setComputePipelineState:", v126);
  v165 = v16->_threadgroupSize;
  v166 = vdupq_n_s64(1uLL);
  objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a10, v143 + 256, &v165);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  objc_msgSend(a3, "setComputePipelineState:", v132);
  v163 = v16->_threadgroupSize;
  v164 = vdupq_n_s64(1uLL);
  objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a10, v143 + 512, &v163);
  if (v141)
  {
    v98 = (void *)objc_opt_class();
    if (objc_msgSend(v98, "isSubclassOfClass:", objc_opt_class()))
    {
      v99 = v16;
      v100 = objc_msgSend(v142, "instanceDescriptorType");
      v237 = objc_msgSend(v142, "instanceCount");
      objc_msgSend(a3, "setBytes:length:atIndex:", &v237, 4, 15);
      v101 = v99;
      v102 = -[MTLGPUBVHBuilder newResourceIDsBufferWithBVHs:retainedResources:encoder:](v99, "newResourceIDsBufferWithBVHs:retainedResources:encoder:", objc_msgSend(v142, "instancedAccelerationStructures"), v137, a3);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", v102, 0, 16);
      v107 = (void *)v127;
      if (!v237)
        goto LABEL_137;
LABEL_130:
      switch(v100)
      {
        case 0:
        case 2:
          v119 = 320;
          goto LABEL_135;
        case 1:
          v119 = 324;
          goto LABEL_135;
        case 3:
        case 4:
          v119 = 328;
LABEL_135:
          v120 = PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, *(_DWORD *)((char *)&v101->super.super.isa + v119), v144);
          break;
        default:
          MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6901, (uint64_t)CFSTR("Unexpected MTLAccelerationStructureInstanceDescriptorType"), v103, v104, v105, v106, (uint64_t)v122);
          v120 = 0;
          break;
      }
      objc_msgSend(a3, "setComputePipelineState:", v120);
      v121 = v101->_threadgroupSize;
      v152 = (v237 + v121 - 1) / v121;
      v153 = vdupq_n_s64(1uLL);
      v150 = v121;
      v151 = v153;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v152, &v150);
      goto LABEL_137;
    }
    v113 = (void *)objc_opt_class();
    v107 = (void *)v127;
    if (!objc_msgSend(v113, "isSubclassOfClass:", objc_opt_class()))
    {
      MTLReportFailure(0, "-[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:]", 6879, (uint64_t)CFSTR("Unexpected MTLAccelerationStructureDescriptor type"), v114, v115, v116, v117, (uint64_t)v122);
      v102 = 0;
      goto LABEL_137;
    }
    v101 = v16;
    v100 = objc_msgSend(v142, "instanceDescriptorType");
    v118 = objc_msgSend(v142, "maxInstanceCount");
    v237 = v118;
    objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v142, "instanceCountBuffer"), objc_msgSend(v142, "instanceCountBufferOffset"), 15);
    v102 = 0;
    if (v118)
      goto LABEL_130;
  }
  else
  {
    v107 = (void *)v127;
    -[MTLGPUBVHBuilder copyFromBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:length:encoder:](v16, "copyFromBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:length:encoder:", v127, 0, a6, v227[8] + a7, 8 * v136, a3);
    v102 = 0;
    if (v148 == 2)
    {
      objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline(p_pipelineCache, v16->KERNEL_INDEX_ENCODE_MTL_CURVE_BVH_CONTROL_POINTS, v144));
      v237 = 0;
      v159 = 0u;
      v160 = 0u;
      v161 = 0u;
      v162 = 0u;
      v108 = (void *)objc_msgSend(v144, "geometryDescriptors");
      v102 = (id)objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v159, v240, 16);
      if (v102)
      {
        v109 = *(_QWORD *)v160;
        v149 = vdupq_n_s64(1uLL);
        do
        {
          for (ii = 0; ii != v102; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v160 != v109)
              objc_enumerationMutation(v108);
            v111 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * (_QWORD)ii);
            v158 = 0;
            v158 = objc_msgSend(v111, "controlPointCount");
            if (v158)
            {
              objc_msgSend(a3, "setBytes:length:atIndex:", &v158, 4, 15);
              objc_msgSend(a3, "setBytes:length:atIndex:", &v237, 4, 16);
              v112 = v16->_threadgroupSize;
              v156 = (v158 + (int)v112 - 1) / v112;
              v157 = v149;
              v154 = v112;
              v155 = v149;
              objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v156, &v154);
            }
            ++v237;
          }
          v102 = (id)objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v159, v240, 16);
        }
        while (v102);
      }
    }
  }
LABEL_137:

}

- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 accelerationStructureUniqueIdentifier:(unint64_t)a12
{
  -[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:](self, "encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

- (void)encodeMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 outputBuffer:(id)a6 outputBufferOffset:(unint64_t)a7 genericBVHBuffer:(id)a8 genericBVHBufferOffset:(unint64_t)a9 scratchBuffer:(id)a10 scratchBufferOffset:(unint64_t)a11 uniqueIdentifier:(unint64_t)a12
{
  -[MTLGPUBVHBuilder encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:](self, "encodeMTLSWBVHWithEncoder:descriptor:bvhDescriptor:outputBuffer:outputBufferOffset:genericBVHBuffer:genericBVHBufferOffset:scratchBuffer:scratchBufferOffset:gpuResourceID:accelerationStructureUniqueIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

- (void)writeMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_GET_MTL_BVH_SIZE_low;
  void *Pipeline;
  uint64_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE v21[20];
  __int128 v22;

  v19 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_GET_MTL_BVH_SIZE_low = LOBYTE(self->KERNEL_INDEX_GET_MTL_BVH_SIZE);
  *(_OWORD *)&v21[4] = 0u;
  v22 = 0u;
  v20 = KERNEL_INDEX_GET_MTL_BVH_SIZE_low;
  *(_QWORD *)v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v16 = vdupq_n_s64(1uLL);
  v17 = v16;
  v18 = 1;
  v15 = v19;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v17, &v15);
}

- (void)writeCompactedMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7 sizeDataType:(unint64_t)a8
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  uint64_t v14;
  int v15;
  void *Pipeline;
  uint64_t v17;
  int64x2_t v18;
  int64x2_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _BYTE v23[20];
  __int128 v24;

  v21 = 0;
  p_pipelineCache = &self->_pipelineCache;
  if (a8 == 33)
    v14 = 332;
  else
    v14 = 336;
  v15 = *((unsigned __int8 *)&self->super.super.isa + v14);
  *(_OWORD *)&v23[4] = 0u;
  v24 = 0u;
  v22 = v15;
  *(_QWORD *)v23 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v22, &v21);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v18 = vdupq_n_s64(1uLL);
  v19 = v18;
  v20 = 1;
  v17 = v21;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v19, &v17);
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9 compact:(BOOL)a10 copyVertexData:(BOOL)a11 copyPerPrimitiveData:(BOOL)a12
{
  _BOOL4 v18;
  _BOOL4 v19;
  unint64_t v20;
  unint64_t v21;
  PipelineCache<PipelineKey> *p_pipelineCache;
  int *v23;
  uint64_t v24;
  int KERNEL_INDEX_COPY_COUNTERS_low;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int16 *v33;
  unsigned int *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int16 *v44;
  uint64_t v45;
  __int16 v46;
  _BYTE *v47;
  uint64_t v48;
  void *Pipeline;
  unint64_t v50;
  uint64_t v51;
  int64x2_t v52;
  uint64_t v53;
  int64x2_t v54;
  int64x2_t v55;
  uint64_t v56;
  uint64_t v57;
  int64x2_t v58;
  uint64_t v59;
  int64x2_t v60;
  __int128 v61;
  uint64_t v62;
  _BYTE v63[24];
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  int64x2_t v67;
  uint64_t v68;
  int64x2_t v69;
  uint64_t v70;
  int64x2_t v71;
  uint64_t v72;
  uint64_t threadgroupSize;
  int64x2_t v74;
  uint64_t v75;
  int64x2_t v76;
  _QWORD v77[11];

  v18 = a12;
  v19 = a11;
  v77[8] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0, a6, a7, a8._impl);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setBytes:length:atIndex:", &a9, 8, 2);
  v20 = 0x1EDCC0000uLL;
  v21 = 0x1EDCC0000uLL;
  if (v19)
  {
    p_pipelineCache = &self->_pipelineCache;
    if (a10)
      v23 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_COPY_AND_COMPACT_MTL_BVH_HEADER;
    else
      v23 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_COPY_MTL_BVH_HEADER;
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v23), self->_pipelineCache.baseThreadgroupSize, 0));
    v24 = (self->_threadgroupSize + 31) / self->_threadgroupSize;
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    v75 = v24;
    v76 = vdupq_n_s64(1uLL);
    threadgroupSize = self->_threadgroupSize;
    v74 = v76;
    objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v75, &threadgroupSize);
    v77[0] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_INNER_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[1] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_LEAF_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[2] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_PRIMITIVES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[3] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_GEOMETRIES, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[4] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_TRANSFORMS, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[5] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_PRIMITIVE_BVHS, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[6] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_CONTROL_POINTS, self->_pipelineCache.baseThreadgroupSize, 0);
    v77[7] = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_COPY_MTL_BVH_RESOURCE_IDS, self->_pipelineCache.baseThreadgroupSize, 0);
    v72 = 0;
    KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
    *(_OWORD *)&v63[8] = 0u;
    v64 = 0u;
    *(_DWORD *)v63 = KERNEL_INDEX_COPY_COUNTERS_low;
    *(_QWORD *)&v63[4] = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)v63, &v72);
    if (self->_supportsDispatchThreadsWithIndirectBuffer)
    {
      v26 = self->_threadgroupSize;
      *(_QWORD *)v63 = objc_msgSend(a4, "gpuAddress") + a5;
      v27 = objc_msgSend(a4, "gpuAddress");
      v28 = 0;
      *(_QWORD *)&v63[8] = a5 + v27 + 200;
      do
      {
        v29 = 0;
        v30 = v28;
        v31 = v28 ^ 7;
        if ((v28 ^ 7) >= 3)
          v31 = 3;
        v51 = v31;
        v32 = v31 + 1;
        v33 = &word_1827FE470[v28];
        v34 = (unsigned int *)&v63[20];
        do
        {
          *((_WORD *)v34 - 2) = v33[v29];
          *((_WORD *)v34 - 1) = 12 * v29;
          *v34 = v26;
          v34 += 2;
          ++v29;
        }
        while (v32 != v29);
        objc_msgSend(a3, "setComputePipelineState:", Pipeline);
        objc_msgSend(a3, "setBytes:length:atIndex:", v63, 48, 30);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v70 = v32;
        v71 = vdupq_n_s64(1uLL);
        v68 = v72;
        v69 = v71;
        objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v70, &v68);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v50 = v30 + v29;
        v35 = &v77[v30];
        v36 = -12;
        do
        {
          v37 = *v35++;
          objc_msgSend(a3, "setComputePipelineState:", v37);
          v66 = self->_threadgroupSize;
          v67 = vdupq_n_s64(1uLL);
          objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", a4, v36 + 212, &v66);
          v36 += 12;
        }
        while (12 * v51 != v36);
        v28 = v50;
      }
      while (v50 <= 7);
      v21 = 0x1EDCC0000;
      v20 = 0x1EDCC0000;
    }
    else
    {
      v38 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:", a3);
      v65 = 0;
      v39 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", 8, v38, &v65);
      objc_msgSend(v38, "addObject:", v39);
      v40 = self->_threadgroupSize;
      *(_QWORD *)v63 = objc_msgSend(a4, "gpuAddress") + a5;
      v41 = objc_msgSend(v39, "gpuAddress");
      v42 = 0;
      v43 = 0;
      *(_QWORD *)&v63[8] = v41;
      v44 = word_1827FE470;
      v45 = v65;
      do
      {
        v46 = *v44++;
        v47 = &v63[v43];
        *((_WORD *)v47 + 8) = v46;
        *((_WORD *)v47 + 9) = v42;
        *((_DWORD *)v47 + 5) = v40;
        v43 += 8;
        v42 += v45;
      }
      while (v43 != 64);
      objc_msgSend(a3, "setComputePipelineState:", Pipeline);
      objc_msgSend(a3, "setBytes:length:atIndex:", v63, 80, 30);
      v20 = 0x1EDCC0000uLL;
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v62 = 1;
      v59 = v72;
      v60 = vdupq_n_s64(1uLL);
      v61 = xmmword_1827FE460;
      objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v61, &v59);
      v21 = 0x1EDCC0000uLL;
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v48 = 0;
      v52 = vdupq_n_s64(1uLL);
      do
      {
        objc_msgSend(a3, "setComputePipelineState:", v77[v48]);
        v57 = self->_threadgroupSize;
        v58 = v52;
        objc_msgSend(a3, "dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:", v39, v65 * v48++, &v57);
      }
      while (v48 != 8);

    }
  }
  if (v18)
  {
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)self + *(int *)(v20 + 2152), self->KERNEL_INDEX_COPY_PRIMITIVE_DATA, *(_QWORD *)((char *)&self->_dispatchBinsTGSize + *(int *)(v20 + 2152)), 0));
    v54 = vdupq_n_s64(1uLL);
    v55 = v54;
    v56 = 1;
    v53 = *(unsigned int *)((char *)&self->super.super.isa + *(int *)(v21 + 2156));
    objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v55, &v53);
  }
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9 compact:(BOOL)a10 copyVertexData:(BOOL)a11 copyPerPrimitiveData:(BOOL)a12
{
  -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](self, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, a4, a5, a6, a7, a8._impl);
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9
{
  uint64_t v9;

  BYTE2(v9) = 1;
  LOWORD(v9) = 256;
  -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](self, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, a4, a5, a6, a7, a8._impl, a9, v9);
}

- (void)copyMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9
{
  -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:](self, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:", a3, a4, a5, a6, a7, a8._impl);
}

- (void)copyAndCompactMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a9
{
  uint64_t v9;

  BYTE2(v9) = 1;
  LOWORD(v9) = 257;
  -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](self, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, a4, a5, a6, a7, a8._impl, a9, v9);
}

- (void)copyAndCompactMTLSWBVHWithEncoder:(id)a3 sourceBuffer:(id)a4 sourceBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7 destinationMTLResourceID:(MTLResourceID)a8 destinationUniqueIdentifier:(unint64_t)a9
{
  -[MTLGPUBVHBuilder copyAndCompactMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:](self, "copyAndCompactMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:", a3, a4, a5, a6, a7, a8._impl);
}

- (id)newInstanceBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5 encodedStride:(unint64_t *)a6
{
  MTLDevice *device;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  if (a6)
    *a6 = 8;
  device = self->_device;
  if ((unint64_t)objc_msgSend(a3, "count", a3, a4, a5) < 2)
    v9 = 8;
  else
    v9 = 8 * objc_msgSend(a3, "count");
  v10 = (void *)-[MTLDevice newBufferWithLength:options:](device, "newBufferWithLength:options:", v9, 0);
  v11 = objc_msgSend(v10, "contents");
  if (objc_msgSend(a3, "count"))
  {
    v12 = 0;
    do
    {
      v13 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "buffer"), "gpuAddress");
      *(_QWORD *)(v11 + 8 * v12) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v12), "bufferOffset")
                                 + v13;
      ++v12;
    }
    while (v12 < objc_msgSend(a3, "count"));
  }
  objc_msgSend(a4, "addObject:", v10);
  return v10;
}

- (id)newResourceIDsBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5
{
  MTLDevice *device;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;

  device = self->_device;
  if ((unint64_t)objc_msgSend(a3, "count") < 2)
    v8 = 8;
  else
    v8 = 8 * objc_msgSend(a3, "count");
  v9 = (void *)-[MTLDevice newBufferWithLength:options:](device, "newBufferWithLength:options:", v8, 0);
  v10 = objc_msgSend(v9, "contents");
  if (objc_msgSend(a3, "count"))
  {
    v11 = 0;
    do
    {
      *(_QWORD *)(v10 + 8 * v11) = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v11), "gpuResourceID");
      ++v11;
    }
    while (v11 < objc_msgSend(a3, "count"));
  }
  objc_msgSend(a4, "addObject:", v9);
  return v9;
}

- (id)newInstanceBufferWithBVHs:(id)a3 retainedResources:(id)a4 encoder:(id)a5
{
  return -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:](self, "newInstanceBufferWithBVHs:retainedResources:encoder:encodedStride:", a3, a4, a5, 0);
}

- (void)getMTLInstanceBoundingBoxesWithEncoder:(id)a3 descriptor:(id)a4 boundingBoxBuffer:(id)a5 boundingBoxBufferOffset:(unint64_t)a6
{
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *Pipeline;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64x2_t v38;
  unint64_t v39;
  int64x2_t v40;
  unint64_t v41;
  int64x2_t v42;
  unint64_t v43;
  int64x2_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  unint64_t v49;
  int v50;
  int v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_opt_class();
  if (objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(a4, "instanceCount"))
    {
      v12 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:", a3);
      v13 = (void *)objc_msgSend(a4, "instancedAccelerationStructures");
      v14 = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:](self, "newInstanceBufferWithBVHs:retainedResources:encoder:", v13, v12, a3);
      useResourcesBatched(v13, 1, a3);
      v51 = objc_msgSend(a4, "instanceCount");
      v50 = objc_msgSend(a4, "instanceDescriptorStride");
      v49 = 0;
      v15 = objc_msgSend(a4, "instanceDescriptorType");
      v16 = objc_msgSend(a4, "instanceTransformationMatrixLayout") == 1;
      v54 = 0;
      v52 = 0u;
      v53 = 0u;
      v17 = ((log2((double)self->_threadgroupSize) & 0xF) << 13) | (unint64_t)(v16 << 40);
      switch(v15)
      {
        case 0:
          v18 = 388;
          goto LABEL_13;
        case 1:
          v18 = 392;
          goto LABEL_13;
        case 2:
          v25 = 388;
          goto LABEL_15;
        case 3:
          v18 = 396;
LABEL_13:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v18);
          goto LABEL_16;
        case 4:
          v25 = 396;
LABEL_15:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v25);
          v17 |= 0x10uLL;
LABEL_16:
          *(_QWORD *)((char *)&v52 + 4) = v17;
          Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v52, &v49);
          break;
        default:
          Pipeline = 0;
          break;
      }
      objc_msgSend(a3, "setComputePipelineState:", Pipeline);
      objc_msgSend(a3, "setBytes:length:atIndex:", &v51, 4, 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 1);
      objc_msgSend(a3, "setBytes:length:atIndex:", &v50, 4, 2);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", v14, 0, 3);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, a6, 4);
      if (objc_msgSend(a4, "motionTransformBuffer"))
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 5);
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v26 = (void *)objc_msgSend(a4, "instancedAccelerationStructures");
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v46;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v46 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(a3, "useResource:usage:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v30++), 1);
          }
          while (v28 != v30);
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v28);
      }
      v31 = v49;
      v32 = (v31 + objc_msgSend(a4, "instanceCount") - 1) / v31;
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v43 = v32;
      v44 = vdupq_n_s64(1uLL);
      v41 = v31;
      v42 = v44;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v43, &v41);

    }
  }
  else
  {
    v19 = (void *)objc_opt_class();
    if (objc_msgSend(v19, "isSubclassOfClass:", objc_opt_class()) && objc_msgSend(a4, "maxInstanceCount"))
    {
      v51 = objc_msgSend(a4, "instanceDescriptorStride");
      v49 = 0;
      v20 = objc_msgSend(a4, "instanceDescriptorType");
      v21 = objc_msgSend(a4, "instanceTransformationMatrixLayout") == 1;
      v54 = 0;
      v52 = 0u;
      v53 = 0u;
      v22 = ((log2((double)self->_threadgroupSize) & 0xF) << 13) | (unint64_t)(v21 << 40);
      switch(v20)
      {
        case 0:
          v23 = 388;
          goto LABEL_33;
        case 1:
          v23 = 392;
          goto LABEL_33;
        case 2:
          v34 = 388;
          goto LABEL_35;
        case 3:
          v23 = 396;
LABEL_33:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v23);
          goto LABEL_36;
        case 4:
          v34 = 396;
LABEL_35:
          LODWORD(v52) = *((unsigned __int8 *)&self->super.super.isa + v34);
          v22 |= 0x10uLL;
LABEL_36:
          *(_QWORD *)((char *)&v52 + 4) = v22;
          v33 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v52, &v49);
          break;
        default:
          v33 = 0;
          break;
      }
      objc_msgSend(a3, "setComputePipelineState:", v33);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceCountBuffer"), objc_msgSend(a4, "instanceCountBufferOffset"), 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "instanceDescriptorBuffer"), objc_msgSend(a4, "instanceDescriptorBufferOffset"), 1);
      objc_msgSend(a3, "setBytes:length:atIndex:", &v51, 4, 2);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, a6, 4);
      if (objc_msgSend(a4, "motionTransformBuffer"))
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(a4, "motionTransformBuffer"), objc_msgSend(a4, "motionTransformBufferOffset"), 5);
      v35 = v49;
      v36 = (v35 + objc_msgSend(a4, "maxInstanceCount") - 1) / v35;
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v39 = v36;
      v40 = vdupq_n_s64(1uLL);
      v37 = v35;
      v38 = v40;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v39, &v37);
    }
  }
}

- (unint64_t)getRefitScratchBufferSizeForDescriptor:(id)a3 bvhDescriptor:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v6 = 0;
  v7 = 0;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", a4, &v9, &v8, &v7, &v6);
  return 12 * objc_msgSend(a4, "maxDepth") + 12;
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13
{
  -[MTLGPUBVHBuilder refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:options:](self, "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:options:", a3, a4, a5, a6, a7, a8, a9, a10._impl, a11, a12, a13, 3);
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13
{
  -[MTLGPUBVHBuilder refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:](self, "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:", a3, a4, a5, a6, a7, a8);
}

- (void)refitVertexDataWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 inPlace:(BOOL)a6 sourceBuffer:(id)a7 sourceBufferOffset:(unint64_t)a8 scratchBuffer:(id)a9 scratchBufferOffset:(unint64_t)a10 retainedResources:(id)a11 innerNodeCapacity:(unint64_t)a12 leafNodeCapacity:(unint64_t)a13
{
  _BOOL4 v13;
  MTLAccelerationStructureDescriptor *v15;
  int MTLSWBVHType;
  int MTLSWBVHPrimitiveType;
  int *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  int *v25;
  int *v26;
  int v27;
  void *v28;
  void *v29;
  int *v30;
  void *v31;
  int v32;
  int *v33;
  int *v34;
  int v35;
  void *v36;
  unint64_t v37;
  void *v38;
  int *v39;
  int *v40;
  void *v41;
  int *v42;
  int *v43;
  unint64_t v44;
  id v45;
  _BOOL4 v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int *v52;
  uint64_t v53;
  int KERNEL_INDEX_COPY_COUNTERS_low;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  int *v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  int *v86;
  int *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int *v99;
  uint64_t v100;
  void *v101;
  _BOOL4 v102;
  void *v103;
  unsigned int v104;
  id v105;
  void *v106;
  MTLAccelerationStructureDescriptor *v107;
  PipelineCache<PipelineKey> *p_pipelineCache;
  int v110;
  unint64_t v112;
  void *Pipeline;
  int64x2_t v114;
  uint64_t v115;
  int64x2_t v116;
  uint64_t v117;
  int64x2_t v118;
  uint64_t v119;
  int64x2_t v120;
  uint64_t v121;
  int64x2_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  int64x2_t v128;
  unint64_t v129;
  int64x2_t v130;
  uint64_t v131;
  int64x2_t v132;
  uint64_t v133;
  int64x2_t v134;
  uint64_t v135;
  int64x2_t v136;
  unint64_t v137;
  int64x2_t v138;
  uint64_t v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  uint64_t threadgroupSize;
  int64x2_t v144;
  unint64_t v145;
  int64x2_t v146;
  int v147;
  _BYTE v148[20];
  __int128 v149;
  _BYTE v150[128];
  uint64_t v151;

  v13 = a6;
  v15 = (MTLAccelerationStructureDescriptor *)a4;
  v151 = *MEMORY[0x1E0C80C00];
  MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType(v15);
  if (v13)
    v20 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INNER_NODE_IN_PLACE;
  else
    v20 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INNER_NODE;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v20), a5);
  v107 = v15;
  v110 = MTLSWBVHType;
  if (!MTLSWBVHType)
  {
    v29 = (void *)objc_msgSend(a5, "geometryDescriptors");
    if (objc_msgSend(v29, "count"))
    {
      if (v13)
      {
        if (refitUpdatesOpacityAndFunctionTableOffset(void)::pred != -1)
          dispatch_once(&refitUpdatesOpacityAndFunctionTableOffset(void)::pred, &__block_literal_global_1);
        if (refitUpdatesOpacityAndFunctionTableOffset(void)::useNewRefitBehavior)
          goto LABEL_47;
        v30 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_GEOMETRIES_IN_PLACE;
      }
      else
      {
        v30 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_GEOMETRIES;
      }
      objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v30), a5));
      -[MTLGPUBVHBuilder setGeometryBufferWithGeometryDescriptors:retainedResources:onEncoder:atIndex:](self, "setGeometryBufferWithGeometryDescriptors:retainedResources:onEncoder:atIndex:", -[MTLAccelerationStructureDescriptor geometryDescriptors](v15, "geometryDescriptors"), a11, a3, 13);
      v37 = (objc_msgSend(v29, "count") + (unint64_t)self->_threadgroupSize - 1) / self->_threadgroupSize;
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v145 = v37;
      v146 = vdupq_n_s64(1uLL);
      threadgroupSize = self->_threadgroupSize;
      v144 = v146;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v145, &threadgroupSize);
      v15 = v107;
    }
LABEL_47:
    if (MTLSWBVHPrimitiveType == 1)
    {
      if (objc_msgSend(v29, "count"))
      {
        v41 = (void *)objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v41, "boundingBoxBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 5);
      }
      v39 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_BBOX_LEAF_NODE;
      v40 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_BBOX_LEAF_NODE_IN_PLACE;
    }
    else
    {
      if (MTLSWBVHPrimitiveType)
      {
        v42 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_LEAF_NODE;
        if (v13)
        {
          v42 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_LEAF_NODE_IN_PLACE;
          v43 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS_IN_PLACE;
        }
        else
        {
          v43 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_CURVE_CONTROL_POINTS;
        }
        v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v42), a5);
        v106 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v43), a5);
        goto LABEL_63;
      }
      if (objc_msgSend(v29, "count"))
      {
        v38 = (void *)objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "buffer"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v38, "vertexBuffers"), "objectAtIndexedSubscript:", 0), "offset"), 2);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", objc_msgSend(v38, "indexBuffer"), objc_msgSend(v38, "indexBufferOffset"), 3);
      }
      v39 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE;
      v40 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_TRIANGLE_LEAF_NODE_IN_PLACE;
    }
    if (v13)
      v39 = v40;
    v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v39), a5);
LABEL_58:
    v106 = 0;
LABEL_63:
    v105 = 0;
    goto LABEL_64;
  }
  v21 = (void *)objc_opt_class();
  if (!objc_msgSend(v21, "isSubclassOfClass:", objc_opt_class()))
  {
    v31 = (void *)objc_opt_class();
    if (!objc_msgSend(v31, "isSubclassOfClass:", objc_opt_class()))
    {
      v105 = 0;
      v106 = 0;
      v28 = 0;
      goto LABEL_64;
    }
    if (-[MTLAccelerationStructureDescriptor instanceTransformationMatrixLayout](v15, "instanceTransformationMatrixLayout") == 1)v32 = 19;
    else
      v32 = 3;
    v147 = v32;
    if (-[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType")
      && -[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") != 2)
    {
      if (-[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") != 1)
      {
        if (-[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") != 3
          && -[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") != 4)
        {
          MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 8036, (uint64_t)CFSTR("Unhandled instance descriptor type"), v95, v96, v97, v98, v100);
          v28 = 0;
          goto LABEL_37;
        }
        v99 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT;
        if (v13)
          v99 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT_IN_PLACE;
        v36 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v99), a5, &v147, 0);
LABEL_36:
        v28 = v36;
LABEL_37:
        objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor instanceDescriptorBuffer](v15, "instanceDescriptorBuffer"), -[MTLAccelerationStructureDescriptor instanceDescriptorBufferOffset](v15, "instanceDescriptorBufferOffset"), 6);
        LODWORD(v140) = 0;
        LODWORD(v140) = -[MTLAccelerationStructureDescriptor instanceDescriptorStride](v15, "instanceDescriptorStride");
        objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 4, 7);
        if (-[MTLAccelerationStructureDescriptor motionTransformBuffer](v15, "motionTransformBuffer"))
          objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor motionTransformBuffer](v15, "motionTransformBuffer"), -[MTLAccelerationStructureDescriptor motionTransformBufferOffset](v15, "motionTransformBufferOffset"), 11);
        LODWORD(v139) = 255;
        if ((-[MTLAccelerationStructureDescriptor usage](v15, "usage") & 4) != 0)
          LODWORD(v139) = -1;
        objc_msgSend(a3, "setBytes:length:atIndex:", &v139, 4, 12);
        goto LABEL_58;
      }
      v33 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID;
      v34 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID_IN_PLACE;
    }
    else
    {
      v33 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT;
      v34 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT_IN_PLACE;
    }
    if (v13)
      v33 = v34;
    v35 = *(_DWORD *)((char *)&self->super.super.isa + *v33);
    v142 = 0;
    v140 = 0u;
    v141 = 0u;
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&self->_pipelineCache, v35, a5, self->_pipelineCache.baseThreadgroupSize, &v147, (uint64_t)&v140);
    v36 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v140, 0);
    goto LABEL_36;
  }
  v22 = (void *)-[MTLAccelerationStructureDescriptor instancedAccelerationStructures](v15, "instancedAccelerationStructures");
  v23 = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:](self, "newInstanceBufferWithBVHs:retainedResources:encoder:", v22, a11, a3);
  useResourcesBatched(v22, 1, a3);
  v105 = v23;
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v23, 0, 10);
  if (-[MTLAccelerationStructureDescriptor instanceTransformationMatrixLayout](v15, "instanceTransformationMatrixLayout") == 1)v24 = 19;
  else
    v24 = 3;
  v147 = v24;
  if (!-[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType")
    || -[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") == 2)
  {
    v25 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT;
    v26 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_DEFAULT_IN_PLACE;
LABEL_12:
    if (v13)
      v25 = v26;
    v27 = *(_DWORD *)((char *)&self->super.super.isa + *v25);
    v142 = 0;
    v140 = 0u;
    v141 = 0u;
    PipelineCache<PipelineKey>::getPipelineKey((unsigned __int8 *)&self->_pipelineCache, v27, a5, self->_pipelineCache.baseThreadgroupSize, &v147, (uint64_t)&v140);
    v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, (uint64_t)&v140, 0);
    goto LABEL_15;
  }
  if (-[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") == 1)
  {
    v25 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID;
    v26 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_USER_ID_IN_PLACE;
    goto LABEL_12;
  }
  if (-[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") == 3
    || -[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType") == 4)
  {
    v25 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT;
    v26 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_LEAF_NODE_INDIRECT_IN_PLACE;
    goto LABEL_12;
  }
  MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 7998, (uint64_t)CFSTR("Unhandled instance descriptor type"), v91, v92, v93, v94, v100);
  v28 = 0;
LABEL_15:
  objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor instanceDescriptorBuffer](v15, "instanceDescriptorBuffer"), -[MTLAccelerationStructureDescriptor instanceDescriptorBufferOffset](v15, "instanceDescriptorBufferOffset"), 6);
  LODWORD(v140) = 0;
  LODWORD(v140) = -[MTLAccelerationStructureDescriptor instanceDescriptorStride](v15, "instanceDescriptorStride");
  objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 4, 7);
  if (-[MTLAccelerationStructureDescriptor motionTransformBuffer](v15, "motionTransformBuffer"))
    objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor motionTransformBuffer](v15, "motionTransformBuffer"), -[MTLAccelerationStructureDescriptor motionTransformBufferOffset](v15, "motionTransformBufferOffset"), 11);
  LODWORD(v139) = 255;
  if ((-[MTLAccelerationStructureDescriptor usage](v15, "usage") & 4) != 0)
    LODWORD(v139) = -1;
  objc_msgSend(a3, "setBytes:length:atIndex:", &v139, 4, 12);
  v106 = 0;
LABEL_64:
  v44 = objc_msgSend(a5, "maxDepth");
  p_pipelineCache = &self->_pipelineCache;
  v112 = (a10 + 255) & 0xFFFFFFFFFFFFFF00;
  if (self->_supportsDispatchThreadsWithIndirectBuffer)
  {
    v45 = a5;
    v46 = v13;
    v104 = 4 * v44 + 256;
    v101 = v28;
    v47 = self->_threadgroupSize;
    *(_QWORD *)&v140 = objc_msgSend(a7, "gpuAddress") + a8;
    *((_QWORD *)&v140 + 1) = objc_msgSend(a9, "gpuAddress") + ((a10 + 255) & 0xFFFFFFFFFFFFFF00);
    if (v110)
      v48 = v47;
    else
      v48 = 0;
    LODWORD(v141) = 16;
    DWORD1(v141) = v48;
    if (v44 >= 0x1F)
      v49 = 31;
    else
      v49 = v44;
    v50 = 4 * v44;
    if (v49)
    {
      v51 = 0;
      v52 = (unsigned int *)&v141 + 3;
      v53 = v50 + v104 - 4;
      do
      {
        ++v51;
        *((_WORD *)v52 - 2) = v53;
        *((_WORD *)v52 - 1) = 12 * v51;
        *v52 = v47;
        v52 += 2;
        v53 -= 4;
      }
      while (v49 != v51);
    }
    v102 = v46;
    v103 = v45;
    v139 = 0;
    KERNEL_INDEX_COPY_COUNTERS_low = LOBYTE(self->KERNEL_INDEX_COPY_COUNTERS);
    *(_OWORD *)&v148[4] = 0u;
    v149 = 0u;
    v147 = KERNEL_INDEX_COPY_COUNTERS_low;
    *(_QWORD *)v148 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
    objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v147, &v139));
    objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 8 * (v49 + 1) + 16, 30);
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    v137 = v49 + 1;
    v138 = vdupq_n_s64(1uLL);
    v135 = v139;
    v136 = v138;
    objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v137, &v135);
    if (v44 >= 0x20)
    {
      v55 = v44 - v49;
      v56 = v50 + v104 - 4 * v49 - 4;
      do
      {
        v57 = v55 - 32;
        if (v55 >= 0x20)
          v55 = 32;
        if (v44 - v49 >= 0x20)
          v58 = 32;
        else
          v58 = v44 - v49;
        if (v58)
        {
          v59 = 0;
          v60 = (unsigned int *)&v141 + 1;
          v61 = v56;
          do
          {
            *((_WORD *)v60 - 2) = v61;
            *((_WORD *)v60 - 1) = 12 * v59;
            *v60 = v47;
            v60 += 2;
            ++v59;
            v61 -= 4;
          }
          while (v55 != v59);
        }
        objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 8 * v58 + 16, 30);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        v133 = v58;
        v134 = vdupq_n_s64(1uLL);
        v131 = v139;
        v132 = v134;
        objc_msgSend(a3, "dispatchThreads:threadsPerThreadgroup:", &v133, &v131);
        v49 += 32;
        v56 -= 128;
        v55 = v57;
      }
      while (v49 < v44);
    }
    a5 = v103;
    v13 = v102;
    v15 = v107;
    v28 = v101;
  }
  else
  {
    v104 = (4 * v44 + 256) >> 2;
  }
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  if (self->_supportsDispatchThreadsWithIndirectBuffer)
  {
    -[MTLGPUBVHBuilder dispatchIndirect:counterBuffer:counterBufferOffset:threadgroupSize:encoder:](self, "dispatchIndirect:counterBuffer:counterBufferOffset:threadgroupSize:encoder:", v28, a9, v112, self->_threadgroupSize, a3);
    if (v44)
    {
      v62 = v112 + 12;
      do
      {
        LODWORD(v140) = v44 - 1;
        objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 4, 14);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        -[MTLGPUBVHBuilder dispatchIndirect:counterBuffer:counterBufferOffset:threadgroupSize:encoder:](self, "dispatchIndirect:counterBuffer:counterBufferOffset:threadgroupSize:encoder:", Pipeline, a9, v62, self->_threadgroupSize, a3);
        v62 += 12;
        --v44;
      }
      while (v44);
    }
  }
  else
  {
    if (v110)
      v63 = self->_threadgroupSize;
    else
      v63 = 1;
    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v28, a9, v112, a7, a8, 4, v63, a3);
    for (; v44; --v44)
    {
      LODWORD(v140) = v44 - 1;
      objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 4, 14);
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", Pipeline, a9, v112, a7, a8, v104 - 1 + v44, self->_threadgroupSize, a3);
    }
  }
  v64 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_HEADER;
  if (v13)
    v64 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_HEADER_IN_PLACE;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v64), a5));
  v65 = ((unint64_t)self->_threadgroupSize + 31) / self->_threadgroupSize;
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v129 = v65;
  v130 = vdupq_n_s64(1uLL);
  v127 = self->_threadgroupSize;
  v128 = v130;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v129, &v127);
  if (v106)
  {
    objc_msgSend(a3, "setComputePipelineState:");
    LODWORD(v140) = 0;
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v66 = (void *)objc_msgSend(a5, "geometryDescriptors");
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v123, v150, 16);
    if (v67)
    {
      v68 = v67;
      v69 = *(_QWORD *)v124;
      v114 = vdupq_n_s64(1uLL);
      do
      {
        for (i = 0; i != v68; ++i)
        {
          if (*(_QWORD *)v124 != v69)
            objc_enumerationMutation(v66);
          v71 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
          v147 = 0;
          v147 = objc_msgSend(v71, "controlPointCount");
          objc_msgSend(a3, "setBytes:length:atIndex:", &v147, 4, 15);
          objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 4, 16);
          v72 = self->_threadgroupSize;
          v121 = (v147 + (int)v72 - 1) / v72;
          v122 = v114;
          v119 = v72;
          v120 = v114;
          objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v121, &v119);
          LODWORD(v140) = v140 + 1;
        }
        v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v123, v150, 16);
      }
      while (v68);
    }
    v15 = v107;
  }
  if (!v110)
    goto LABEL_129;
  v73 = (void *)objc_opt_class();
  if (!objc_msgSend(v73, "isSubclassOfClass:", objc_opt_class()))
  {
    v80 = (void *)objc_opt_class();
    if (objc_msgSend(v80, "isSubclassOfClass:", objc_opt_class()))
    {
      v74 = -[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType");
      v85 = -[MTLAccelerationStructureDescriptor maxInstanceCount](v15, "maxInstanceCount");
      LODWORD(v140) = v85;
      objc_msgSend(a3, "setBuffer:offset:atIndex:", -[MTLAccelerationStructureDescriptor instanceCountBuffer](v15, "instanceCountBuffer"), -[MTLAccelerationStructureDescriptor instanceCountBufferOffset](v15, "instanceCountBufferOffset"), 15);
      v75 = 0;
      if (v85)
        goto LABEL_126;
LABEL_130:
      v88 = v105;
      goto LABEL_141;
    }
    MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 8231, (uint64_t)CFSTR("Unexpected MTLAccelerationStructureDescriptor type"), v81, v82, v83, v84, v100);
LABEL_129:
    v75 = 0;
    goto LABEL_130;
  }
  v74 = -[MTLAccelerationStructureDescriptor instanceDescriptorType](v15, "instanceDescriptorType");
  LODWORD(v140) = -[MTLAccelerationStructureDescriptor instanceCount](v15, "instanceCount");
  objc_msgSend(a3, "setBytes:length:atIndex:", &v140, 4, 15);
  v75 = -[MTLGPUBVHBuilder newResourceIDsBufferWithBVHs:retainedResources:encoder:](self, "newResourceIDsBufferWithBVHs:retainedResources:encoder:", -[MTLAccelerationStructureDescriptor instancedAccelerationStructures](v15, "instancedAccelerationStructures"), a11, a3);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v75, 0, 16);
  if (!(_DWORD)v140)
    goto LABEL_130;
LABEL_126:
  switch(v74)
  {
    case 0:
    case 2:
      v86 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT;
      v87 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_DEFAULT_IN_PLACE;
      goto LABEL_137;
    case 1:
      v86 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID;
      v87 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_USER_ID_IN_PLACE;
      goto LABEL_137;
    case 3:
    case 4:
      v86 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT;
      v87 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_INSTANCE_RESOURCE_IDS_INDIRECT_IN_PLACE;
LABEL_137:
      if (v13)
        v86 = v87;
      v89 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v86), a5);
      break;
    default:
      MTLReportFailure(0, "-[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:]", 8253, (uint64_t)CFSTR("Unexpected MTLAccelerationStructureInstanceDescriptorType"), v76, v77, v78, v79, v100);
      v89 = 0;
      break;
  }
  v88 = v105;
  objc_msgSend(a3, "setComputePipelineState:", v89);
  v90 = self->_threadgroupSize;
  v117 = ((int)v140 + (int)v90 - 1) / v90;
  v118 = vdupq_n_s64(1uLL);
  v115 = v90;
  v116 = v118;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v117, &v115);
LABEL_141:

}

- (void)refitPrimitiveData:(id)a3 inPlace:(BOOL)a4 bvhDescriptor:(id)a5
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int *v8;
  uint64_t threadgroupSize;
  uint64_t v10;
  int64x2_t v11;
  int64x2_t v12;
  uint64_t v13;

  p_pipelineCache = &self->_pipelineCache;
  if (a4)
    v8 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_PRIMITIVE_DATA_IN_PLACE;
  else
    v8 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_REFIT_PRIMITIVE_DATA;
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v8), a5));
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  threadgroupSize = self->_threadgroupSize;
  v11 = vdupq_n_s64(1uLL);
  v12 = v11;
  v13 = 1;
  v10 = threadgroupSize;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v12, &v10);
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationAccelerationStructureUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13 options:(unint64_t)a14
{
  char v21;
  int MTLSWBVHType;
  uint64_t MTLSWBVHPrimitiveType;
  id v24;
  uint64_t v25;
  _BOOL4 v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t n;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  _BOOL4 v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  unint64_t v63;
  unsigned int v64;
  id v65;
  MTLGPUBVHBuilder *v66;
  uint64_t v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v21 = a14;
  v98 = *MEMORY[0x1E0C80C00];
  v61 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  MTLSWBVHType = getMTLSWBVHType((MTLAccelerationStructureDescriptor *)a4);
  v60 = a4;
  MTLSWBVHPrimitiveType = getMTLSWBVHPrimitiveType((MTLAccelerationStructureDescriptor *)a4);
  objc_msgSend(a5, "updatePipelineKey");
  v91 = 0;
  v92 = 0;
  v89 = 0;
  v90 = 0;
  v65 = a5;
  v66 = self;
  v24 = a5;
  v25 = MTLSWBVHPrimitiveType;
  -[MTLBVHBuilder getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:](self, "getCapacitiesForDescriptor:fragmentCapacity:innerNodeCapacity:leafNodeCapacity:primitiveDataCapacity:", v24, &v92, &v91, &v90, &v89);
  ++v91;
  v27 = a6 == a8 && a7 == a9;
  if (a8)
    v28 = v27;
  else
    v28 = 1;
  v64 = v28;
  v62 = a6;
  v63 = a7;
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 0);
  v59 = a8;
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a8, a9, 1);
  if (!MTLSWBVHType)
  {
    if (-[MTLGPUBVHBuilder useResourceBufferForDescriptor:](self, "useResourceBufferForDescriptor:", v65))
    {
      -[MTLGPUBVHBuilder setResourceBufferWithDescriptor:retainedResources:onEncoder:atIndex:](self, "setResourceBufferWithDescriptor:retainedResources:onEncoder:atIndex:", v65, v61, a3, 23);
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = (id)objc_msgSend(v65, "geometryDescriptors");
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v86;
        v67 = *(_QWORD *)v86;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v86 != v31)
              objc_enumerationMutation(obj);
            v33 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
            if ((v21 & 2) != 0 && objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "primitiveDataBuffer"))
              objc_msgSend(a3, "useResource:usage:", objc_msgSend(v33, "primitiveDataBuffer"), 1);
            if ((v21 & 1) != 0)
            {
              if ((_DWORD)v25 == 1)
              {
                v79 = 0u;
                v80 = 0u;
                v77 = 0u;
                v78 = 0u;
                v41 = (void *)objc_msgSend(v33, "boundingBoxBuffers");
                v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
                if (v42)
                {
                  v43 = v42;
                  v44 = *(_QWORD *)v78;
                  do
                  {
                    for (j = 0; j != v43; ++j)
                    {
                      if (*(_QWORD *)v78 != v44)
                        objc_enumerationMutation(v41);
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "buffer"), 1);
                    }
                    v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
                  }
                  while (v43);
                }
              }
              else
              {
                v34 = v25;
                if ((_DWORD)v25)
                {
                  v75 = 0uLL;
                  v76 = 0uLL;
                  v73 = 0uLL;
                  v74 = 0uLL;
                  v46 = (void *)objc_msgSend(v33, "controlPointBuffers");
                  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
                  if (v47)
                  {
                    v48 = v47;
                    v49 = *(_QWORD *)v74;
                    do
                    {
                      for (k = 0; k != v48; ++k)
                      {
                        if (*(_QWORD *)v74 != v49)
                          objc_enumerationMutation(v46);
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "buffer"), 1);
                      }
                      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
                    }
                    while (v48);
                  }
                  v71 = 0u;
                  v72 = 0u;
                  v69 = 0u;
                  v70 = 0u;
                  v51 = (void *)objc_msgSend(v33, "radiusBuffers");
                  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v69, v93, 16);
                  if (v52)
                  {
                    v53 = v52;
                    v54 = *(_QWORD *)v70;
                    do
                    {
                      for (m = 0; m != v53; ++m)
                      {
                        if (*(_QWORD *)v70 != v54)
                          objc_enumerationMutation(v51);
                        objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "buffer"), 1);
                      }
                      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v69, v93, 16);
                    }
                    while (v53);
                  }
                  v40 = objc_msgSend(v33, "indexBuffer");
                  v25 = v34;
                  v31 = v67;
                  goto LABEL_57;
                }
                v83 = 0uLL;
                v84 = 0uLL;
                v81 = 0uLL;
                v82 = 0uLL;
                v35 = (void *)objc_msgSend(v33, "vertexBuffers");
                v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                if (v36)
                {
                  v37 = v36;
                  v38 = *(_QWORD *)v82;
                  do
                  {
                    for (n = 0; n != v37; ++n)
                    {
                      if (*(_QWORD *)v82 != v38)
                        objc_enumerationMutation(v35);
                      objc_msgSend(a3, "useResource:usage:", objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * n), "buffer"), 1);
                    }
                    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
                  }
                  while (v37);
                }
                if (objc_msgSend(v33, "indexBuffer"))
                  objc_msgSend(a3, "useResource:usage:", objc_msgSend(v33, "indexBuffer"), 1);
                v25 = v34;
                v31 = v67;
                if (objc_msgSend(v33, "transformationMatrixBuffer"))
                {
                  v40 = objc_msgSend(v33, "transformationMatrixBuffer");
LABEL_57:
                  objc_msgSend(a3, "useResource:usage:", v40, 1);
                  continue;
                }
              }
            }
          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
        }
        while (v30);
      }
    }
  }
  objc_msgSend(a3, "setBytes:length:atIndex:", &a11, 8, 9);
  if ((v21 & 1) != 0)
    -[MTLGPUBVHBuilder refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:](v66, "refitVertexDataWithEncoder:descriptor:bvhDescriptor:inPlace:sourceBuffer:sourceBufferOffset:scratchBuffer:scratchBufferOffset:retainedResources:innerNodeCapacity:leafNodeCapacity:", a3, v60, v65, v64, v62, v63, a12, a13, v61, v91, v90);
  if ((v21 & 2) != 0 && v89)
    -[MTLGPUBVHBuilder refitPrimitiveData:inPlace:bvhDescriptor:](v66, "refitPrimitiveData:inPlace:bvhDescriptor:", a3, v64, v65);
  if ((v64 & 1) == 0)
  {
    v57 = (v21 & 2) == 0 && v89 != 0;
    if ((v21 & 1) == 0 || v57)
    {
      BYTE2(v58) = v57;
      BYTE1(v58) = (v21 & 1) == 0;
      LOBYTE(v58) = 0;
      -[MTLGPUBVHBuilder copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:](v66, "copyMTLSWBVHWithEncoder:sourceBuffer:sourceBufferOffset:toBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:compact:copyVertexData:copyPerPrimitiveData:", a3, v62, v63, v59, a9, a10._impl, a11, v58);
    }
  }
}

- (void)refitMTLSWBVHWithEncoder:(id)a3 descriptor:(id)a4 bvhDescriptor:(id)a5 sourceBuffer:(id)a6 sourceBufferOffset:(unint64_t)a7 destinationBuffer:(id)a8 destinationBufferOffset:(unint64_t)a9 destinationMTLResourceID:(MTLResourceID)a10 destinationUniqueIdentifier:(unint64_t)a11 scratchBuffer:(id)a12 scratchBufferOffset:(unint64_t)a13 options:(unint64_t)a14
{
  -[MTLGPUBVHBuilder refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:options:](self, "refitMTLSWBVHWithEncoder:descriptor:bvhDescriptor:sourceBuffer:sourceBufferOffset:destinationBuffer:destinationBufferOffset:destinationMTLResourceID:destinationAccelerationStructureUniqueIdentifier:scratchBuffer:scratchBufferOffset:options:", a3, a4, a5, a6, a7, a8);
}

- (void)writeSerializedMTLSWBVHSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  void *Pipeline;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_SIZE, self->_pipelineCache.baseThreadgroupSize, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v15 = vdupq_n_s64(1uLL);
  v16 = 1;
  v13 = v15;
  v14 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v15, &v13);
}

- (void)writeSerializedMTLSWBVHRawSizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  void *Pipeline;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_SERIALIZED_MTL_BVH_RAW_SIZE, self->_pipelineCache.baseThreadgroupSize, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v15 = vdupq_n_s64(1uLL);
  v16 = 1;
  v13 = v15;
  v14 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v15, &v13);
}

- (void)writeDeserializedMTLSWBVHSizeWithEncoder:(id)a3 serializedBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE_low;
  void *Pipeline;
  uint64_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE v21[20];
  __int128 v22;

  v19 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE_low = LOBYTE(self->KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE);
  *(_OWORD *)&v21[4] = 0u;
  v22 = 0u;
  v20 = KERNEL_INDEX_GET_DESERIALIZED_MTL_BVH_SIZE_low;
  *(_QWORD *)v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v16 = vdupq_n_s64(1uLL);
  v17 = v16;
  v18 = 1;
  v15 = v19;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v17, &v15);
}

- (void)writeDeserializedMTLSWPrimitiveBVHSizesWithEncoder:(id)a3 serializedBuffer:(id)a4 serializedBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizesBufferOffset:(unint64_t)a7
{
  id v13;
  void *v14;
  void *Pipeline;
  id v16;

  v13 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  v14 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8, 0);
  objc_msgSend(v13, "addObject:", v14);
  -[MTLGPUBVHBuilder writeDeserializedMTLSWBVHSizeWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizeBufferOffset:](self, "writeDeserializedMTLSWBVHSizeWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizeBufferOffset:", a3, a4, a5, v14, 0);
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_DESERIALIZED_MTL_PRIMITIVE_BVH_SIZES, self->_pipelineCache.baseThreadgroupSize, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  v16 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", 1, v13, 0);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  -[MTLGPUBVHBuilder dispatchIndirect64:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect64:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", Pipeline, v16, 0, v14, 0, 0, self->_threadgroupSize, a3);

}

- (void)writeSerializationDataWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 destinationBufferOffset:(unint64_t)a7
{
  id v13;
  void *v14;
  void *Pipeline;
  int64x2_t v16;
  uint64_t v17;
  int64x2_t v18;
  uint64_t v19;

  v13 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  v14 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8, 0);
  objc_msgSend(v13, "addObject:", v14);
  -[MTLGPUBVHBuilder writeSerializedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:](self, "writeSerializedMTLSWBVHSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", a3, a4, a5, v14, 0);
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_MTL_BVH_SERIALIZATION_DATA, self->_pipelineCache.baseThreadgroupSize, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v14, 0, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 2);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v18 = vdupq_n_s64(1uLL);
  v19 = 1;
  v16 = v18;
  v17 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v18, &v16);

}

- (void)writeSerializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 toBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8
{
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *Pipeline;
  void *v19;
  id v20;
  id v21;
  MTLGPUBVHBuilder *v22;
  void *v23;
  uint64_t threadgroupSize;
  id v26;
  int v27;
  int64x2_t v28;
  uint64_t v29;
  int64x2_t v30;
  uint64_t v31;

  v14 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  -[MTLGPUBVHBuilder writeSerializationDataWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:destinationBufferOffset:](self, "writeSerializationDataWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:destinationBufferOffset:", a3, a4, a5, a7, a8);
  v15 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8, 0);
  v16 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0);
  objc_msgSend(v14, "addObject:", v15);
  -[MTLGPUBVHBuilder writeSerializedMTLSWBVHRawSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:](self, "writeSerializedMTLSWBVHRawSizeWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:sizeBufferOffset:", a3, a4, a5, v15, 0);
  v17 = a8 + 24;
  v26 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", 1, v14, 0);
  -[MTLGPUBVHBuilder fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:](self, "fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:", a3, v17, v15, 0, v14);
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_SERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v16, 0, 1);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v30 = vdupq_n_s64(1uLL);
  v31 = 1;
  v28 = v30;
  v29 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v30, &v28);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, v17, 1);
  if (a6)
  {
    v19 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_PATCH_SERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0);
    v20 = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:](self, "newInstanceBufferWithBVHs:retainedResources:encoder:", a6, v14, a3);
    v21 = -[MTLGPUBVHBuilder newResourceIDsBufferWithBVHs:retainedResources:encoder:](self, "newResourceIDsBufferWithBVHs:retainedResources:encoder:", a6, v14, a3);
    useResourcesBatched(a6, 1, a3);
    v27 = objc_msgSend(a6, "count");
    objc_msgSend(a3, "setBuffer:offset:atIndex:", v20, 0, 2);
    objc_msgSend(a3, "setBytes:length:atIndex:", &v27, 4, 3);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", v21, 0, 4);
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    threadgroupSize = self->_threadgroupSize;
    v22 = self;
    v23 = v26;
    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](v22, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v19, v26, 0, v16, 0, 0, threadgroupSize, a3);
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v23 = v26;
  }

}

- (void)writeDeserializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 fromBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8 accelerationStructureMTLResourceID:(MTLResourceID)a9 accelerationStructureUniqueIdentifier:(unint64_t)a10
{
  id v16;
  void *v17;
  void *v18;
  void *Pipeline;
  id v20;
  id v21;
  MTLGPUBVHBuilder *v22;
  void *v23;
  uint64_t threadgroupSize;
  id v26;
  int64x2_t v27;
  uint64_t v28;
  int64x2_t v29;
  uint64_t v30;

  v16 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  v17 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 8, 0);
  v18 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0);
  objc_msgSend(v16, "addObject:", v17);
  -[MTLGPUBVHBuilder writeDeserializedMTLSWBVHSizeWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizeBufferOffset:](self, "writeDeserializedMTLSWBVHSizeWithEncoder:serializedBuffer:serializedBufferOffset:toBuffer:sizeBufferOffset:", a3, a7, a8, v17, 0);
  v26 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", 1, v16, 0);
  -[MTLGPUBVHBuilder fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:](self, "fastIndirectGPUMemcpyWithEncoder:indirectBuffer:indirectBufferOffset:srcBuffer:srcBufferOffset:dstBuffer:dstBufferOffset:lengthBuffer:lengthOffset:retainedResources:", a3, a5, v17, 0, v16);
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_DESERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0));
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, a8 + 24, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", v18, 0, 2);
  objc_msgSend(a3, "setBytes:length:atIndex:", &a10, 8, 3);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v29 = vdupq_n_s64(1uLL);
  v30 = 1;
  v27 = v29;
  v28 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v29, &v27);
  if (a6)
  {
    Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_PATCH_DESERIALIZED_MTL_BVH, self->_pipelineCache.baseThreadgroupSize, 0);
    v20 = -[MTLGPUBVHBuilder newInstanceBufferWithBVHs:retainedResources:encoder:](self, "newInstanceBufferWithBVHs:retainedResources:encoder:", a6, v16, a3);
    v21 = -[MTLGPUBVHBuilder newResourceIDsBufferWithBVHs:retainedResources:encoder:](self, "newResourceIDsBufferWithBVHs:retainedResources:encoder:", a6, v16, a3);
    useResourcesBatched(a6, 1, a3);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", v20, 0, 2);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", v21, 0, 3);
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    threadgroupSize = self->_threadgroupSize;
    v22 = self;
    v23 = v26;
    -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](v22, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", Pipeline, v26, 0, v18, 0, 0, threadgroupSize, a3);
  }
  else
  {
    v20 = 0;
    v21 = 0;
    v23 = v26;
  }

}

- (void)writeDeserializedMTLSWBVHWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 primitiveAccelerationStructures:(id)a6 fromBuffer:(id)a7 serializedBufferOffset:(unint64_t)a8 accelerationStructureMTLResourceID:(MTLResourceID)a9 uniqueIdentifier:(unint64_t)a10
{
  -[MTLGPUBVHBuilder writeDeserializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:accelerationStructureMTLResourceID:accelerationStructureUniqueIdentifier:](self, "writeDeserializedMTLSWBVHWithEncoder:BVHBuffer:BVHBufferOffset:primitiveAccelerationStructures:fromBuffer:serializedBufferOffset:accelerationStructureMTLResourceID:accelerationStructureUniqueIdentifier:", a3, a4, a5, a6, a7, a8);
}

- (void)writeSerializedGeometrySizeWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_GET_GEOMETRY_SIZE_low;
  void *Pipeline;
  uint64_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE v21[20];
  __int128 v22;

  v19 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_GET_GEOMETRY_SIZE_low = LOBYTE(self->KERNEL_INDEX_GET_GEOMETRY_SIZE);
  *(_OWORD *)&v21[4] = 0u;
  v22 = 0u;
  v20 = KERNEL_INDEX_GET_GEOMETRY_SIZE_low;
  *(_QWORD *)v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v16 = vdupq_n_s64(1uLL);
  v17 = v16;
  v18 = 1;
  v15 = v19;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v17, &v15);
}

- (void)writeSerializedGeometryPrimitiveCountWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 countBufferOffset:(unint64_t)a7
{
  PipelineCache<PipelineKey> *p_pipelineCache;
  int KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT_low;
  void *Pipeline;
  uint64_t v15;
  int64x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _BYTE v21[20];
  __int128 v22;

  v19 = 0;
  p_pipelineCache = &self->_pipelineCache;
  KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT_low = LOBYTE(self->KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT);
  *(_OWORD *)&v21[4] = 0u;
  v22 = 0u;
  v20 = KERNEL_INDEX_GET_GEOMETRY_PRIMITIVE_COUNT_low;
  *(_QWORD *)v21 = (log2((double)self->_pipelineCache.baseThreadgroupSize) & 0xF) << 13;
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, (uint64_t)&v20, &v19);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v16 = vdupq_n_s64(1uLL);
  v17 = v16;
  v18 = 1;
  v15 = v19;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v17, &v15);
}

- (void)writeSerializedGeometryWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 geometryBufferOffset:(unint64_t)a7
{
  id v13;
  void *Pipeline;
  void *v15;
  id v16;

  v13 = -[MTLGPUBVHBuilder retainedResourcesArrayWithEncoder:](self, "retainedResourcesArrayWithEncoder:");
  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVES, self->_pipelineCache.baseThreadgroupSize, 0);
  v15 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 4, 0);
  objc_msgSend(v13, "addObject:", v15);
  -[MTLGPUBVHBuilder writeSerializedGeometryPrimitiveCountWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:countBufferOffset:](self, "writeSerializedGeometryPrimitiveCountWithEncoder:BVHBuffer:BVHBufferOffset:toBuffer:countBufferOffset:", a3, a4, a5, v15, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  v16 = -[MTLGPUBVHBuilder newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:](self, "newIndirectBufferWithCapacity:withRetainedResources:indirectBufferStride:", 1, v13, 0);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", Pipeline, v16, 0, v15, 0, 0, self->_threadgroupSize, self->_threadgroupSize, a3);

}

- (void)writeGenericBVHStructureSizesWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizesBufferOffset:(unint64_t)a7
{
  -[MTLGPUBVHBuilder writeGenericBVHStructureSizesWithEncoder:version:BVHBuffer:BVHBufferOffset:toBuffer:sizesBufferOffset:](self, "writeGenericBVHStructureSizesWithEncoder:version:BVHBuffer:BVHBufferOffset:toBuffer:sizesBufferOffset:", a3, 256, a4, a5, a6, a7);
}

- (BOOL)writeGenericBVHStructureSizesWithEncoder:(id)a3 version:(unint64_t)a4 BVHBuffer:(id)a5 BVHBufferOffset:(unint64_t)a6 toBuffer:(id)a7 sizesBufferOffset:(unint64_t)a8
{
  unint64_t v8;
  void *Pipeline;
  int64x2_t v16;
  uint64_t v17;
  int64x2_t v18;
  uint64_t v19;

  v8 = a4 - 256;
  if (a4 - 256 <= 5)
  {
    Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *off_1E0FE28C8[v8]), self->_pipelineCache.baseThreadgroupSize, 0);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a5, a6, 0);
    objc_msgSend(a3, "setBuffer:offset:atIndex:", a7, a8, 1);
    objc_msgSend(a3, "setComputePipelineState:", Pipeline);
    if (objc_msgSend(a3, "dispatchType") == 1)
      objc_msgSend(a3, "memoryBarrierWithScope:", 1);
    v18 = vdupq_n_s64(1uLL);
    v19 = 1;
    v16 = v18;
    v17 = 1;
    objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v18, &v16);
  }
  return v8 < 6;
}

- (void)writeGenericBVHStructureWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 header:(id)a6 headerBufferOffset:(unint64_t)a7 innerNodes:(id)a8 innerNodeBufferOffset:(unint64_t)a9 leafNodes:(id)a10 leafNodeBufferOffset:(unint64_t)a11 primitives:(id)a12 primitiveBufferOffset:(unint64_t)a13 geometry:(id)a14 geometryOffset:(unint64_t)a15 instanceTransform:(id)a16 instanceTransformOffset:(unint64_t)a17 controlPoints:(id)a18 controlPointBufferOffset:(unint64_t)a19
{
  MTLGenericBVHBuffersSPI *v26;

  v26 = -[MTLGenericBVHBuffersSPI initWithVersion:]([MTLGenericBVHBuffersSPI alloc], "initWithVersion:", 256);
  -[MTLGenericBVHBuffersSPI setHeaderBuffer:](v26, "setHeaderBuffer:", a6);
  -[MTLGenericBVHBuffersSPI setHeaderBufferOffset:](v26, "setHeaderBufferOffset:", a7);
  -[MTLGenericBVHBuffersSPI setInnerNodeBuffer:](v26, "setInnerNodeBuffer:", a8);
  -[MTLGenericBVHBuffersSPI setInnerNodeBufferOffset:](v26, "setInnerNodeBufferOffset:", a9);
  -[MTLGenericBVHBuffersSPI setLeafNodeBuffer:](v26, "setLeafNodeBuffer:", a10);
  -[MTLGenericBVHBuffersSPI setLeafNodeBufferOffset:](v26, "setLeafNodeBufferOffset:", a11);
  -[MTLGenericBVHBuffersSPI setPrimitiveBuffer:](v26, "setPrimitiveBuffer:", a12);
  -[MTLGenericBVHBuffersSPI setPrimitiveBufferOffset:](v26, "setPrimitiveBufferOffset:", a13);
  -[MTLGenericBVHBuffersSPI setGeometryBuffer:](v26, "setGeometryBuffer:", a14);
  -[MTLGenericBVHBuffersSPI setGeometryBufferOffset:](v26, "setGeometryBufferOffset:", a15);
  -[MTLGenericBVHBuffersSPI setInstanceTransformBuffer:](v26, "setInstanceTransformBuffer:", a16);
  -[MTLGenericBVHBuffersSPI setInstanceTransformBufferOffset:](v26, "setInstanceTransformBufferOffset:", a17);
  -[MTLGenericBVHBuffersSPI setControlPointBuffer:](v26, "setControlPointBuffer:", a18);
  -[MTLGenericBVHBuffersSPI setControlPointBufferOffset:](v26, "setControlPointBufferOffset:", a19);
  -[MTLGPUBVHBuilder writeGenericBVHStructureWithEncoder:BVHBuffer:BVHBufferOffset:into:](self, "writeGenericBVHStructureWithEncoder:BVHBuffer:BVHBufferOffset:into:", a3, a4, a5, v26);

}

- (BOOL)writeGenericBVHStructureWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 into:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PipelineCache<PipelineKey> *p_pipelineCache;
  void *Pipeline;
  int *v16;
  BOOL result;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2;
  unint64_t baseThreadgroupSize;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  int64x2_t v50;
  int64x2_t v51;
  uint64_t v52;
  uint64_t threadgroupSize;
  int64x2_t v54;
  int64x2_t v55;
  uint64_t v56;
  int64x2_t v57;
  uint64_t v58;
  int64x2_t v59;
  uint64_t v60;

  v10 = objc_msgSend(a6, "headerBuffer");
  v48 = objc_msgSend(a6, "headerBufferOffset");
  v46 = objc_msgSend(a6, "innerNodeBuffer");
  v11 = objc_msgSend(a6, "innerNodeBufferOffset");
  v42 = objc_msgSend(a6, "leafNodeBuffer");
  v36 = objc_msgSend(a6, "leafNodeBufferOffset");
  v43 = objc_msgSend(a6, "primitiveBuffer");
  v37 = objc_msgSend(a6, "primitiveBufferOffset");
  v44 = (void *)objc_msgSend(a6, "geometryBuffer");
  v38 = objc_msgSend(a6, "geometryBufferOffset");
  v45 = (void *)objc_msgSend(a6, "instanceTransformBuffer");
  v39 = objc_msgSend(a6, "instanceTransformBufferOffset");
  v12 = objc_msgSend(a6, "perPrimitiveDataBuffer");
  v13 = objc_msgSend(a6, "perPrimitiveDataBufferOffset");
  v40 = (void *)v12;
  v41 = (void *)objc_msgSend(a6, "controlPointBuffer");
  v34 = v13;
  v35 = objc_msgSend(a6, "controlPointBufferOffset");
  switch(objc_msgSend(a6, "version"))
  {
    case 256:
      p_pipelineCache = &self->_pipelineCache;
      Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_0, self->_pipelineCache.baseThreadgroupSize, 0);
      v33 = 28;
      v32 = 24;
      v31 = 20;
      v30 = 16;
      v29 = 12;
      v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_0;
      goto LABEL_9;
    case 257:
    case 258:
      p_pipelineCache = &self->_pipelineCache;
      Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_HEADER_1_1, self->_pipelineCache.baseThreadgroupSize, 0);
      v33 = 32;
      v32 = 28;
      v31 = 24;
      v30 = 20;
      v29 = 16;
      v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_1;
      goto LABEL_9;
    case 259:
      p_pipelineCache = &self->_pipelineCache;
      v18 = 544;
      goto LABEL_8;
    case 260:
      p_pipelineCache = &self->_pipelineCache;
      v18 = 712;
      goto LABEL_8;
    case 261:
      p_pipelineCache = &self->_pipelineCache;
      v18 = 716;
LABEL_8:
      Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + v18), p_pipelineCache->baseThreadgroupSize, 0);
      v33 = 32;
      v32 = 28;
      v31 = 24;
      v30 = 20;
      v29 = 16;
      v16 = &OBJC_IVAR___MTLGPUBVHBuilder_KERNEL_INDEX_EXTRACT_MTL_BVH_LEAF_NODES_1_3;
LABEL_9:
      v19 = PipelineCache<PipelineKey>::getPipeline((uint64_t)p_pipelineCache, *(_DWORD *)((char *)&self->super.super.isa + *v16), p_pipelineCache->baseThreadgroupSize, 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
      objc_msgSend(a3, "setBuffer:offset:atIndex:", v10, v48, 1);
      objc_msgSend(a3, "setComputePipelineState:", Pipeline);
      if (objc_msgSend(a3, "dispatchType") == 1)
        objc_msgSend(a3, "memoryBarrierWithScope:", 1);
      v59 = vdupq_n_s64(1uLL);
      v60 = 1;
      v57 = v59;
      v58 = 1;
      objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v59, &v57);
      v20 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:", 12, 0);
      if (v46)
      {
        v21 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_INNER_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v46, v11, 1);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", v21, v20, 0, v10, v29 + v48, 0, self->_threadgroupSize, self->_threadgroupSize, a3);
      }
      if (v42)
      {
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v42, v36, 1);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", v19, v20, 0, v10, v30 + v48, 0, self->_threadgroupSize, self->_threadgroupSize, a3);
      }
      if (v43)
      {
        v22 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_PRIMITIVE_NODES, self->_pipelineCache.baseThreadgroupSize, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v43, v37, 1);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:threadgroupSize:encoder:", v22, v20, 0, v10, v31 + v48, 0, self->_threadgroupSize, self->_threadgroupSize, a3);
      }
      if (objc_msgSend(v44, "length"))
      {
        if ((unint64_t)objc_msgSend(a6, "version") < 0x103)
        {
          v25 = objc_msgSend(a6, "version");
          baseThreadgroupSize = self->_pipelineCache.baseThreadgroupSize;
          if (v25 < 0x102)
            v26 = 568;
          else
            v26 = 660;
          KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2 = *(_DWORD *)((char *)&self->super.super.isa + v26);
        }
        else
        {
          KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2 = self->KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2;
          baseThreadgroupSize = self->_pipelineCache.baseThreadgroupSize;
        }
        v27 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, KERNEL_INDEX_EXTRACT_MTL_BVH_GEOMETRY_1_2, baseThreadgroupSize, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v44, v38, 1);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v27, v20, 0, v10, v32 + v48, 0, self->_threadgroupSize, a3);
      }
      if (objc_msgSend(v45, "length"))
      {
        v28 = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_MTL_BVH_TRANSFORMS, self->_pipelineCache.baseThreadgroupSize, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v45, v39, 1);
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        -[MTLGPUBVHBuilder dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:](self, "dispatchIndirect:indirectBuffer:indirectBufferOffset:threadCountBuffer:threadCountBufferOffset:threadCountIndex:threadgroupDivisor:encoder:", v28, v20, 0, v10, v33 + v48, 0, self->_threadgroupSize, a3);
      }
      if (objc_msgSend(v40, "length"))
      {
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_PRIMITIVE_DATA, self->_pipelineCache.baseThreadgroupSize, 0));
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v40, v34, 1);
        v54 = vdupq_n_s64(1uLL);
        v55 = v54;
        v56 = 1;
        threadgroupSize = self->_threadgroupSize;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v55, &threadgroupSize);
      }
      if (objc_msgSend(v41, "length"))
      {
        if (objc_msgSend(a3, "dispatchType") == 1)
          objc_msgSend(a3, "memoryBarrierWithScope:", 1);
        objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_EXTRACT_CONTROL_POINT_DATA, self->_pipelineCache.baseThreadgroupSize, 0));
        objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
        objc_msgSend(a3, "setBuffer:offset:atIndex:", v41, v35, 1);
        v50 = vdupq_n_s64(1uLL);
        v51 = v50;
        v52 = 1;
        v49 = self->_threadgroupSize;
        objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v51, &v49);
      }

      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)writeAccelerationStructureSerializationDataWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 offset:(unint64_t)a7
{
  void *Pipeline;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  Pipeline = PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_WRITE_SERIALIZATION_DATA, self->_pipelineCache.baseThreadgroupSize, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", Pipeline);
  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  v15 = vdupq_n_s64(1uLL);
  v16 = 1;
  v13 = v15;
  v14 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v15, &v13);
}

+ (unint64_t)getMaxAccelerationStructureTraversalDepth:(unint64_t)a3
{
  return 32 * a3;
}

- (void)writeMTLSWBVHAccelerationStructureDepthWithEncoder:(id)a3 BVHBuffer:(id)a4 BVHBufferOffset:(unint64_t)a5 toBuffer:(id)a6 sizeBufferOffset:(unint64_t)a7
{
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  if (objc_msgSend(a3, "dispatchType") == 1)
    objc_msgSend(a3, "memoryBarrierWithScope:", 1);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a4, a5, 0);
  objc_msgSend(a3, "setBuffer:offset:atIndex:", a6, a7, 1);
  objc_msgSend(a3, "setComputePipelineState:", PipelineCache<PipelineKey>::getPipeline((uint64_t)&self->_pipelineCache, self->KERNEL_INDEX_GET_MTL_BVH_DEPTH, self->_pipelineCache.baseThreadgroupSize, 0));
  v15 = vdupq_n_s64(1uLL);
  v16 = 1;
  v13 = v15;
  v14 = 1;
  objc_msgSend(a3, "dispatchThreadgroups:threadsPerThreadgroup:", &v15, &v13);
}

- (void).cxx_destruct
{
  PipelineCache<PipelineKey>::~PipelineCache((uint64_t)&self->_pipelineCache);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_QWORD *)self + 17) = 0;
  *(_DWORD *)((char *)self + 143) = 0;
  return self;
}

- (void)initWithDevice:
{
}

- (_QWORD)initWithDevice:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E0FE1C40;
  result[1] = v3;
  return result;
}

- (uint64_t)initWithDevice:
{
    return a1 + 8;
  else
    return 0;
}

@end
