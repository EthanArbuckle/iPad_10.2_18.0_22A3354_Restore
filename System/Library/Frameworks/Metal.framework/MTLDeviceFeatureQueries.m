@implementation MTLDeviceFeatureQueries

+ (MTLDeviceFeatureQueries)allocWithZone:(_NSZone *)a3
{
  objc_super v6;

  if ((id)objc_opt_class() == a1)
    return (MTLDeviceFeatureQueries *)+[MTLDeviceFeatureQueries allocWithZone:](_MTLDeviceFeatureQueries, "allocWithZone:", a3);
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MTLDeviceFeatureQueries;
  return (MTLDeviceFeatureQueries *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
}

- (MTLDeviceFeatureQueries)initWithDevice:(id)a3
{
  return 0;
}

- (BOOL)supportsBufferlessClientStorageTexture
{
  return 0;
}

- (BOOL)supportsComputeMemoryBarrier
{
  return 0;
}

- (BOOL)supportsRenderMemoryBarrier
{
  return 0;
}

- (BOOL)supportsPartialRenderMemoryBarrier
{
  return 0;
}

- (BOOL)supportsArgumentBuffersTier2
{
  return 0;
}

- (BOOL)supportsReadWriteTextureArgumentsTier2
{
  return 0;
}

- (BOOL)supportsStreamingCodecSignaling
{
  return 0;
}

- (BOOL)supportsProgrammableSamplePositions
{
  return 0;
}

- (BOOL)supportsLargeFramebufferConfigs
{
  return 0;
}

- (BOOL)supportsCustomBorderColor
{
  return 0;
}

- (BOOL)supportsSamplerAddressModeClampToHalfBorder
{
  return 0;
}

- (BOOL)supportsBCTextureCompression
{
  return 0;
}

- (BOOL)supports3DBCTextures
{
  return 0;
}

- (BOOL)supportsRGBA10A2Gamma
{
  return 0;
}

- (BOOL)supportsBGR10A2
{
  return 0;
}

- (BOOL)supportsPrimitiveRestartOverride
{
  return 0;
}

- (BOOL)supportsGlobalVariableRelocation
{
  return 0;
}

- (BOOL)supportsGlobalVariableRelocationRender
{
  return 0;
}

- (BOOL)supportsGlobalVariableRelocationCompute
{
  return 0;
}

- (BOOL)supportsTLS
{
  return 0;
}

- (BOOL)supportsGlobalVariableBindings
{
  return 0;
}

- (BOOL)supportsGlobalVariableBindingInDylibs
{
  return 0;
}

- (BOOL)supports32bpcMSAATextures
{
  return 0;
}

- (BOOL)supports32BitMSAA
{
  return 0;
}

- (BOOL)supports32BitFloatFiltering
{
  return 0;
}

- (BOOL)supportsQueryTextureLOD
{
  return 0;
}

- (BOOL)supportsVertexAmplification
{
  return 0;
}

- (BOOL)supportsPlacementHeaps
{
  return 0;
}

- (BOOL)supportsOpenCLTextureWriteSwizzles
{
  return 0;
}

- (BOOL)supportsPullModelInterpolation
{
  return 0;
}

- (BOOL)supportsInt64
{
  return 0;
}

- (BOOL)supportsFixedLinePointFillDepthGradient
{
  return 0;
}

- (BOOL)supportsLateEvalEvent
{
  return 0;
}

- (BOOL)supportsNonZeroTextureWriteLOD
{
  return 0;
}

- (BOOL)supportsSharedTextureHandles
{
  return 0;
}

- (BOOL)supportsBufferPrefetchStatistics
{
  return 0;
}

- (BOOL)supportsLimitedYUVFormats
{
  return 0;
}

- (BOOL)supportsNonPrivateDepthStencilTextures
{
  return 0;
}

- (BOOL)supportsNonPrivateMSAATextures
{
  return 0;
}

- (BOOL)supportsSharedStorageHeapResources
{
  return 0;
}

- (BOOL)supportsSharedStorageTextures
{
  return 0;
}

- (BOOL)supportsLinearTextureFromSharedBuffer
{
  return 0;
}

- (BOOL)supportsPipelineLibraries
{
  return 0;
}

- (BOOL)supportsFragmentOnlyEncoders
{
  return 0;
}

- (BOOL)supportsBufferWithIOSurface
{
  return 0;
}

- (BOOL)supportsProgrammableBlending
{
  return 0;
}

- (BOOL)supportsRenderToLinearTextures
{
  return 0;
}

- (BOOL)supportsMemorylessRenderTargets
{
  return 0;
}

- (BOOL)supportsFastMathInfNaNPropagation
{
  return 0;
}

- (BOOL)supportsInvariantVertexPosition
{
  return 0;
}

- (BOOL)supportsShaderLODAverage
{
  return 0;
}

- (BOOL)supportsRelaxedTextureViewRequirements
{
  return 0;
}

- (BOOL)supportsSeparateDepthStencil
{
  return 0;
}

- (BOOL)supportsGPUStatistics
{
  return 0;
}

- (BOOL)supportsCompressedTextureViewSPI
{
  return 0;
}

- (BOOL)supportsRenderTargetTextureRotation
{
  return 0;
}

- (BOOL)supportsDynamicControlPointCount
{
  return 0;
}

- (BOOL)supportsIABHashForTools
{
  return 0;
}

- (BOOL)supportsBinaryArchives
{
  return 0;
}

- (BOOL)supportsBinaryLibraries
{
  return 0;
}

- (BOOL)supportsDeadlineProfile
{
  return 0;
}

- (BOOL)supportsFillTexture
{
  return 0;
}

- (BOOL)supportsSetThreadgroupPackingDisabled
{
  return 0;
}

- (BOOL)supportsASTCTextureCompression
{
  return 0;
}

- (BOOL)supportsExtendedYUVFormats
{
  return 0;
}

- (BOOL)supportsPublicXR10Formats
{
  return 0;
}

- (BOOL)supportsSRGBwrites
{
  return 0;
}

- (BOOL)supportsDepthClipMode
{
  return 0;
}

- (BOOL)supportsResourceHeaps
{
  return 0;
}

- (BOOL)supportsArgumentBuffers
{
  return 0;
}

- (BOOL)supportsPacked32TextureBufferWrites
{
  return 0;
}

- (BOOL)supports3DASTCTextures
{
  return 0;
}

- (BOOL)supportsExtendedXR10Formats
{
  return 0;
}

- (BOOL)supportsFragmentBufferWrites
{
  return 0;
}

- (BOOL)supportsCountingOcclusionQuery
{
  return 0;
}

- (BOOL)supportsBaseVertexInstanceDrawing
{
  return 0;
}

- (BOOL)supportsIndirectDrawAndDispatch
{
  return 0;
}

- (BOOL)supportsTessellation
{
  return 0;
}

- (BOOL)supportsReadWriteBufferArguments
{
  return 0;
}

- (BOOL)supportsArrayOfTextures
{
  return 0;
}

- (BOOL)supportsArrayOfSamplers
{
  return 0;
}

- (BOOL)supportsCombinedMSAAStoreAndResolveAction
{
  return 0;
}

- (BOOL)supportsMutableTier1ArgumentBuffers
{
  return 0;
}

- (BOOL)supportsSamplerCompareFunction
{
  return 0;
}

- (BOOL)supportsMSAADepthResolve
{
  return 0;
}

- (BOOL)supportsMSAAStencilResolve
{
  return 0;
}

- (BOOL)supportsMSAADepthResolveFilter
{
  return 0;
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  return 0;
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  return 0;
}

- (BOOL)supportsIndirectStageInRegion
{
  return 0;
}

- (BOOL)supportsIndirectTextures
{
  return 0;
}

- (BOOL)supportsNorm16BCubicFiltering
{
  return 0;
}

- (BOOL)supportsTextureOutOfBoundsReads
{
  return 0;
}

- (BOOL)supportsTextureSwizzle
{
  return 0;
}

- (BOOL)supportsAlphaYUVFormats
{
  return 0;
}

- (BOOL)supportsMemoryOrderAtomics
{
  return 0;
}

- (BOOL)supportsQuadGroup
{
  return 0;
}

- (BOOL)supportsRenderTextureWrites
{
  return 0;
}

- (BOOL)supportsImageBlocks
{
  return 0;
}

- (BOOL)supportsTileShaders
{
  return 0;
}

- (BOOL)supportsImageBlockSampleCoverageControl
{
  return 0;
}

- (BOOL)supportsNativeHardwareFP16
{
  return 0;
}

- (BOOL)supportsPostDepthCoverage
{
  return 0;
}

- (BOOL)supportsMipLevelsSmallerThanBlockSize
{
  return 0;
}

- (BOOL)supportsNonUniformThreadgroupSize
{
  return 0;
}

- (BOOL)supportsReadWriteTextureArguments
{
  return 0;
}

- (BOOL)supportsReadWriteTextureCubeArguments
{
  return 0;
}

- (BOOL)supportsTextureCubeArray
{
  return 0;
}

- (BOOL)supportsQuadShufflesAndBroadcast
{
  return 0;
}

- (BOOL)supportsConcurrentComputeDispatch
{
  return 0;
}

- (BOOL)supportsRenderPassWithoutRenderTarget
{
  return 0;
}

- (BOOL)supportsRasterOrderGroups
{
  return 0;
}

- (BOOL)supportsRasterOrderGroupsColorAttachment
{
  return 0;
}

- (BOOL)supportsDynamicAttributeStride
{
  return 0;
}

- (BOOL)supportsLinearTexture2DArray
{
  return 0;
}

- (BOOL)supportsNonSquareTileShaders
{
  return 0;
}

- (BOOL)supportsSeparateVisibilityAndShadingRate
{
  return 0;
}

- (BOOL)supports2DLinearTexArraySPI
{
  return 0;
}

- (BOOL)supportsLayeredRendering
{
  return 0;
}

- (BOOL)supportsViewportAndScissorArray
{
  return 0;
}

- (BOOL)supportsIndirectTessellation
{
  return 0;
}

- (BOOL)supportsMSAAStencilResolveFilter
{
  return 0;
}

- (BOOL)supportsStencilFeedback
{
  return 0;
}

- (BOOL)supportsFP32TessFactors
{
  return 0;
}

- (BOOL)supportsUnalignedVertexFetch
{
  return 0;
}

- (BOOL)supportsExtendedVertexFormats
{
  return 0;
}

- (BOOL)supportsResourceDetachBacking
{
  return 0;
}

- (BOOL)supportsBufferWithAddressRanges
{
  return 0;
}

- (BOOL)supportsHeapWithAddressRanges
{
  return 0;
}

- (BOOL)supportsSIMDGroup
{
  return 0;
}

- (BOOL)supportsShaderMinLODClamp
{
  return 0;
}

- (BOOL)supportsSIMDShufflesAndBroadcast
{
  return 0;
}

- (BOOL)supportsWritableArrayOfTextures
{
  return 0;
}

- (BOOL)supportsVariableRateRasterization
{
  return 0;
}

- (BOOL)supportsYCBCRFormats
{
  return 0;
}

- (BOOL)supportsYCBCRFormatsPQ
{
  return 0;
}

- (BOOL)supportsYCBCRFormats12
{
  return 0;
}

- (BOOL)supportsYCBCRFormatsXR
{
  return 0;
}

- (BOOL)supportsASTCHDRTextureCompression
{
  return 0;
}

- (BOOL)supportsSparseTextures
{
  return 0;
}

- (BOOL)supportsSparseHeaps
{
  return 0;
}

- (BOOL)supportsIndirectWritableTextures
{
  return 0;
}

- (BOOL)supportsFunctionPointers
{
  return 0;
}

- (BOOL)supportsDynamicLibraries
{
  return 0;
}

- (BOOL)supportsStatefulDynamicLibraries
{
  return 0;
}

- (BOOL)supportsRenderDynamicLibraries
{
  return 0;
}

- (BOOL)supportsFunctionPointersFromRender
{
  return 0;
}

- (BOOL)supportsSharedFunctionTables
{
  return 0;
}

- (BOOL)supportsRaytracingFromRender
{
  return 0;
}

- (BOOL)supportsPrimitiveMotionBlur
{
  return 0;
}

- (BOOL)supportsRayTracingExtendedVertexFormats
{
  return 0;
}

- (BOOL)supportsHeapAccelerationStructureAllocation
{
  return 0;
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  return 0;
}

- (BOOL)supportsRayTracingTraversalMetrics
{
  return 0;
}

- (BOOL)supportsRayTracingBuffersFromTables
{
  return 0;
}

- (BOOL)supportsRayTracingAccelerationStructureCPUDeserialization
{
  return 0;
}

- (BOOL)supportsRayTracingMultiLevelInstancing
{
  return 0;
}

- (BOOL)supportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return 0;
}

- (BOOL)supportsRayTracingGPUTableUpdateBuffers
{
  return 0;
}

- (BOOL)supportsRayTracingCurves
{
  return 0;
}

- (BOOL)supportsShaderBarycentricCoordinates
{
  return 0;
}

- (BOOL)supportsBlackOrWhiteSamplerBorderColors
{
  return 0;
}

- (BOOL)supportsMirrorClampToEdgeSamplerMode
{
  return 0;
}

- (BOOL)supportsSIMDReduction
{
  return 0;
}

- (BOOL)supportsDepthClipModeClampExtended
{
  return 0;
}

- (BOOL)supportsTexture2DMultisampleArray
{
  return 0;
}

- (BOOL)supportsForceSeamsOnCubemaps
{
  return 0;
}

- (BOOL)supportsFloat16BCubicFiltering
{
  return 0;
}

- (BOOL)supportsFloat16InfNanFiltering
{
  return 0;
}

- (BOOL)supportsRTZRounding
{
  return 0;
}

- (BOOL)supportsAnisoSampleFix
{
  return 0;
}

- (BOOL)supportsYCBCRPackedFormatsPQ
{
  return 0;
}

- (BOOL)supportsYCBCRPackedFormats12
{
  return 0;
}

- (BOOL)supportsYCBCRPackedFormatsXR
{
  return 0;
}

- (BOOL)supportsBufferBoundsChecking
{
  return 0;
}

- (BOOL)supportsForkJoin
{
  return 0;
}

- (BOOL)supportsDevicePartitioning
{
  return 0;
}

- (BOOL)supportsComputeCompressedTextureWrite
{
  return 0;
}

- (BOOL)supportsSIMDGroupMatrix
{
  return 0;
}

- (BOOL)supportsInterchangeTiled
{
  return 0;
}

- (BOOL)supportsQuadReduction
{
  return 0;
}

- (BOOL)supportsVirtualSubstreams
{
  return 0;
}

- (BOOL)supportsSIMDShuffleAndFill
{
  return 0;
}

- (BOOL)supportsBfloat16Format
{
  return 0;
}

- (BOOL)supportsSparseDepthAttachments
{
  return 0;
}

- (BOOL)supportsAtomicUlongVoidMinMax
{
  return 0;
}

- (BOOL)supportsLossyCompression
{
  return 0;
}

- (BOOL)supportsMeshShaders
{
  return 0;
}

- (BOOL)supportsFunctionPointersFromMesh
{
  return 0;
}

- (BOOL)supportsMeshShadersInICB
{
  return 0;
}

- (BOOL)supportsMeshRenderDynamicLibraries
{
  return 0;
}

- (BOOL)supportsBfloat16Buffers
{
  return 0;
}

- (BOOL)supportsCommandBufferJump
{
  return 0;
}

- (BOOL)supportsColorSpaceConversionMatrixSelection
{
  return 0;
}

- (BOOL)supportsPerPlaneCompression
{
  return 0;
}

- (BOOL)supportsConditionalLoadStore
{
  return 0;
}

- (BOOL)supportsStackOverflowErrorCode
{
  return 0;
}

- (BOOL)supportsRayTracingICBs
{
  return 0;
}

- (BOOL)supportsPerformanceStateAssertion
{
  return 0;
}

- (BOOL)supportsExplicitVisibilityGroups
{
  return 0;
}

- (BOOL)supportsRayTracingMatrixLayout
{
  return 0;
}

- (BOOL)supportsRayTracingDirectIntersectionResultAccess
{
  return 0;
}

- (BOOL)supportsRayTracingPerComponentMotionInterpolation
{
  return 0;
}

- (BOOL)supportsExtendedSamplerLODBiasRange
{
  return 0;
}

- (BOOL)supportsDeviceCoherency
{
  return 0;
}

- (BOOL)familySupportsBufferlessClientStorageTexture
{
  return self->_familySupportsBufferlessClientStorageTexture;
}

- (BOOL)familySupportsComputeMemoryBarrier
{
  return self->_familySupportsComputeMemoryBarrier;
}

- (BOOL)familySupportsRenderMemoryBarrier
{
  return self->_familySupportsRenderMemoryBarrier;
}

- (BOOL)familySupportsPartialRenderMemoryBarrier
{
  return self->_familySupportsPartialRenderMemoryBarrier;
}

- (BOOL)familySupportsArgumentBuffersTier2
{
  return self->_familySupportsArgumentBuffersTier2;
}

- (BOOL)familySupportsReadWriteTextureArgumentsTier2
{
  return self->_familySupportsReadWriteTextureArgumentsTier2;
}

- (BOOL)familySupportsStreamingCodecSignaling
{
  return self->_familySupportsStreamingCodecSignaling;
}

- (BOOL)familySupportsProgrammableSamplePositions
{
  return self->_familySupportsProgrammableSamplePositions;
}

- (BOOL)familySupportsLargeFramebufferConfigs
{
  return self->_familySupportsLargeFramebufferConfigs;
}

- (BOOL)familySupportsCustomBorderColor
{
  return self->_familySupportsCustomBorderColor;
}

- (BOOL)familySupportsSamplerAddressModeClampToHalfBorder
{
  return self->_familySupportsSamplerAddressModeClampToHalfBorder;
}

- (BOOL)familySupportsBCTextureCompression
{
  return self->_familySupportsBCTextureCompression;
}

- (BOOL)familySupports3DBCTextures
{
  return self->_familySupports3DBCTextures;
}

- (BOOL)familySupportsRGBA10A2Gamma
{
  return self->_familySupportsRGBA10A2Gamma;
}

- (BOOL)familySupportsBGR10A2
{
  return self->_familySupportsBGR10A2;
}

- (BOOL)familySupportsPrimitiveRestartOverride
{
  return self->_familySupportsPrimitiveRestartOverride;
}

- (BOOL)familySupportsGlobalVariableRelocation
{
  return self->_familySupportsGlobalVariableRelocation;
}

- (BOOL)familySupportsGlobalVariableRelocationRender
{
  return self->_familySupportsGlobalVariableRelocationRender;
}

- (BOOL)familySupportsGlobalVariableRelocationCompute
{
  return self->_familySupportsGlobalVariableRelocationCompute;
}

- (BOOL)familySupportsTLS
{
  return self->_familySupportsTLS;
}

- (BOOL)familySupportsGlobalVariableBindings
{
  return self->_familySupportsGlobalVariableBindings;
}

- (BOOL)familySupportsGlobalVariableBindingInDylibs
{
  return self->_familySupportsGlobalVariableBindingInDylibs;
}

- (BOOL)familySupports32bpcMSAATextures
{
  return self->_familySupports32bpcMSAATextures;
}

- (BOOL)familySupports32BitMSAA
{
  return self->_familySupports32BitMSAA;
}

- (BOOL)familySupports32BitFloatFiltering
{
  return self->_familySupports32BitFloatFiltering;
}

- (BOOL)familySupportsQueryTextureLOD
{
  return self->_familySupportsQueryTextureLOD;
}

- (BOOL)familySupportsVertexAmplification
{
  return self->_familySupportsVertexAmplification;
}

- (BOOL)familySupportsPlacementHeaps
{
  return self->_familySupportsPlacementHeaps;
}

- (BOOL)familySupportsOpenCLTextureWriteSwizzles
{
  return self->_familySupportsOpenCLTextureWriteSwizzles;
}

- (BOOL)familySupportsPullModelInterpolation
{
  return self->_familySupportsPullModelInterpolation;
}

- (BOOL)familySupportsInt64
{
  return self->_familySupportsInt64;
}

- (BOOL)familySupportsFixedLinePointFillDepthGradient
{
  return self->_familySupportsFixedLinePointFillDepthGradient;
}

- (BOOL)familySupportsLateEvalEvent
{
  return self->_familySupportsLateEvalEvent;
}

- (BOOL)familySupportsNonZeroTextureWriteLOD
{
  return self->_familySupportsNonZeroTextureWriteLOD;
}

- (BOOL)familySupportsSharedTextureHandles
{
  return self->_familySupportsSharedTextureHandles;
}

- (BOOL)familySupportsBufferPrefetchStatistics
{
  return self->_familySupportsBufferPrefetchStatistics;
}

- (BOOL)familySupportsLimitedYUVFormats
{
  return self->_familySupportsLimitedYUVFormats;
}

- (BOOL)familySupportsNonPrivateDepthStencilTextures
{
  return self->_familySupportsNonPrivateDepthStencilTextures;
}

- (BOOL)familySupportsNonPrivateMSAATextures
{
  return self->_familySupportsNonPrivateMSAATextures;
}

- (BOOL)familySupportsSharedStorageHeapResources
{
  return self->_familySupportsSharedStorageHeapResources;
}

- (BOOL)familySupportsSharedStorageTextures
{
  return self->_familySupportsSharedStorageTextures;
}

- (BOOL)familySupportsLinearTextureFromSharedBuffer
{
  return self->_familySupportsLinearTextureFromSharedBuffer;
}

- (BOOL)familySupportsPipelineLibraries
{
  return self->_familySupportsPipelineLibraries;
}

- (BOOL)familySupportsFragmentOnlyEncoders
{
  return self->_familySupportsFragmentOnlyEncoders;
}

- (BOOL)familySupportsBufferWithIOSurface
{
  return self->_familySupportsBufferWithIOSurface;
}

- (BOOL)familySupportsProgrammableBlending
{
  return self->_familySupportsProgrammableBlending;
}

- (BOOL)familySupportsRenderToLinearTextures
{
  return self->_familySupportsRenderToLinearTextures;
}

- (BOOL)familySupportsMemorylessRenderTargets
{
  return self->_familySupportsMemorylessRenderTargets;
}

- (BOOL)familySupportsFastMathInfNaNPropagation
{
  return self->_familySupportsFastMathInfNaNPropagation;
}

- (BOOL)familySupportsInvariantVertexPosition
{
  return self->_familySupportsInvariantVertexPosition;
}

- (BOOL)familySupportsShaderLODAverage
{
  return self->_familySupportsShaderLODAverage;
}

- (BOOL)familySupportsRelaxedTextureViewRequirements
{
  return self->_familySupportsRelaxedTextureViewRequirements;
}

- (BOOL)familySupportsSeparateDepthStencil
{
  return self->_familySupportsSeparateDepthStencil;
}

- (BOOL)familySupportsGPUStatistics
{
  return self->_familySupportsGPUStatistics;
}

- (BOOL)familySupportsCompressedTextureViewSPI
{
  return self->_familySupportsCompressedTextureViewSPI;
}

- (BOOL)familySupportsRenderTargetTextureRotation
{
  return self->_familySupportsRenderTargetTextureRotation;
}

- (BOOL)familySupportsDynamicControlPointCount
{
  return self->_familySupportsDynamicControlPointCount;
}

- (BOOL)familySupportsIABHashForTools
{
  return self->_familySupportsIABHashForTools;
}

- (BOOL)familySupportsBinaryArchives
{
  return self->_familySupportsBinaryArchives;
}

- (BOOL)familySupportsBinaryLibraries
{
  return self->_familySupportsBinaryLibraries;
}

- (BOOL)familySupportsDeadlineProfile
{
  return self->_familySupportsDeadlineProfile;
}

- (BOOL)familySupportsFillTexture
{
  return self->_familySupportsFillTexture;
}

- (BOOL)familySupportsSetThreadgroupPackingDisabled
{
  return self->_familySupportsSetThreadgroupPackingDisabled;
}

- (BOOL)familySupportsASTCTextureCompression
{
  return self->_familySupportsASTCTextureCompression;
}

- (BOOL)familySupportsExtendedYUVFormats
{
  return self->_familySupportsExtendedYUVFormats;
}

- (BOOL)familySupportsPublicXR10Formats
{
  return self->_familySupportsPublicXR10Formats;
}

- (BOOL)familySupportsSRGBwrites
{
  return self->_familySupportsSRGBwrites;
}

- (BOOL)familySupportsDepthClipMode
{
  return self->_familySupportsDepthClipMode;
}

- (BOOL)familySupportsResourceHeaps
{
  return self->_familySupportsResourceHeaps;
}

- (BOOL)familySupportsArgumentBuffers
{
  return self->_familySupportsArgumentBuffers;
}

- (BOOL)familySupportsPacked32TextureBufferWrites
{
  return self->_familySupportsPacked32TextureBufferWrites;
}

- (BOOL)familySupports3DASTCTextures
{
  return self->_familySupports3DASTCTextures;
}

- (BOOL)familySupportsExtendedXR10Formats
{
  return self->_familySupportsExtendedXR10Formats;
}

- (BOOL)familySupportsFragmentBufferWrites
{
  return self->_familySupportsFragmentBufferWrites;
}

- (BOOL)familySupportsCountingOcclusionQuery
{
  return self->_familySupportsCountingOcclusionQuery;
}

- (BOOL)familySupportsBaseVertexInstanceDrawing
{
  return self->_familySupportsBaseVertexInstanceDrawing;
}

- (BOOL)familySupportsIndirectDrawAndDispatch
{
  return self->_familySupportsIndirectDrawAndDispatch;
}

- (BOOL)familySupportsTessellation
{
  return self->_familySupportsTessellation;
}

- (BOOL)familySupportsReadWriteBufferArguments
{
  return self->_familySupportsReadWriteBufferArguments;
}

- (BOOL)familySupportsArrayOfTextures
{
  return self->_familySupportsArrayOfTextures;
}

- (BOOL)familySupportsArrayOfSamplers
{
  return self->_familySupportsArrayOfSamplers;
}

- (BOOL)familySupportsCombinedMSAAStoreAndResolveAction
{
  return self->_familySupportsCombinedMSAAStoreAndResolveAction;
}

- (BOOL)familySupportsMutableTier1ArgumentBuffers
{
  return self->_familySupportsMutableTier1ArgumentBuffers;
}

- (BOOL)familySupportsSamplerCompareFunction
{
  return self->_familySupportsSamplerCompareFunction;
}

- (BOOL)familySupportsMSAADepthResolve
{
  return self->_familySupportsMSAADepthResolve;
}

- (BOOL)familySupportsMSAAStencilResolve
{
  return self->_familySupportsMSAAStencilResolve;
}

- (BOOL)familySupportsMSAADepthResolveFilter
{
  return self->_familySupportsMSAADepthResolveFilter;
}

- (BOOL)familySupportsGFXIndirectCommandBuffers
{
  return self->_familySupportsGFXIndirectCommandBuffers;
}

- (BOOL)familySupportsCMPIndirectCommandBuffers
{
  return self->_familySupportsCMPIndirectCommandBuffers;
}

- (BOOL)familySupportsIndirectStageInRegion
{
  return self->_familySupportsIndirectStageInRegion;
}

- (BOOL)familySupportsIndirectTextures
{
  return self->_familySupportsIndirectTextures;
}

- (BOOL)familySupportsNorm16BCubicFiltering
{
  return self->_familySupportsNorm16BCubicFiltering;
}

- (BOOL)familySupportsTextureOutOfBoundsReads
{
  return self->_familySupportsTextureOutOfBoundsReads;
}

- (BOOL)familySupportsTextureSwizzle
{
  return self->_familySupportsTextureSwizzle;
}

- (BOOL)familySupportsAlphaYUVFormats
{
  return self->_familySupportsAlphaYUVFormats;
}

- (BOOL)familySupportsMemoryOrderAtomics
{
  return self->_familySupportsMemoryOrderAtomics;
}

- (BOOL)familySupportsQuadGroup
{
  return self->_familySupportsQuadGroup;
}

- (BOOL)familySupportsRenderTextureWrites
{
  return self->_familySupportsRenderTextureWrites;
}

- (BOOL)familySupportsImageBlocks
{
  return self->_familySupportsImageBlocks;
}

- (BOOL)familySupportsTileShaders
{
  return self->_familySupportsTileShaders;
}

- (BOOL)familySupportsImageBlockSampleCoverageControl
{
  return self->_familySupportsImageBlockSampleCoverageControl;
}

- (BOOL)familySupportsNativeHardwareFP16
{
  return self->_familySupportsNativeHardwareFP16;
}

- (BOOL)familySupportsPostDepthCoverage
{
  return self->_familySupportsPostDepthCoverage;
}

- (BOOL)familySupportsMipLevelsSmallerThanBlockSize
{
  return self->_familySupportsMipLevelsSmallerThanBlockSize;
}

- (BOOL)familySupportsNonUniformThreadgroupSize
{
  return self->_familySupportsNonUniformThreadgroupSize;
}

- (BOOL)familySupportsReadWriteTextureArguments
{
  return self->_familySupportsReadWriteTextureArguments;
}

- (BOOL)familySupportsReadWriteTextureCubeArguments
{
  return self->_familySupportsReadWriteTextureCubeArguments;
}

- (BOOL)familySupportsTextureCubeArray
{
  return self->_familySupportsTextureCubeArray;
}

- (BOOL)familySupportsQuadShufflesAndBroadcast
{
  return self->_familySupportsQuadShufflesAndBroadcast;
}

- (BOOL)familySupportsConcurrentComputeDispatch
{
  return self->_familySupportsConcurrentComputeDispatch;
}

- (BOOL)familySupportsRenderPassWithoutRenderTarget
{
  return self->_familySupportsRenderPassWithoutRenderTarget;
}

- (BOOL)familySupportsRasterOrderGroups
{
  return self->_familySupportsRasterOrderGroups;
}

- (BOOL)familySupportsRasterOrderGroupsColorAttachment
{
  return self->_familySupportsRasterOrderGroupsColorAttachment;
}

- (BOOL)familySupportsDynamicAttributeStride
{
  return self->_familySupportsDynamicAttributeStride;
}

- (BOOL)familySupportsLinearTexture2DArray
{
  return self->_familySupportsLinearTexture2DArray;
}

- (BOOL)familySupportsNonSquareTileShaders
{
  return self->_familySupportsNonSquareTileShaders;
}

- (BOOL)familySupportsSeparateVisibilityAndShadingRate
{
  return self->_familySupportsSeparateVisibilityAndShadingRate;
}

- (BOOL)familySupports2DLinearTexArraySPI
{
  return self->_familySupports2DLinearTexArraySPI;
}

- (BOOL)familySupportsLayeredRendering
{
  return self->_familySupportsLayeredRendering;
}

- (BOOL)familySupportsViewportAndScissorArray
{
  return self->_familySupportsViewportAndScissorArray;
}

- (BOOL)familySupportsIndirectTessellation
{
  return self->_familySupportsIndirectTessellation;
}

- (BOOL)familySupportsMSAAStencilResolveFilter
{
  return self->_familySupportsMSAAStencilResolveFilter;
}

- (BOOL)familySupportsStencilFeedback
{
  return self->_familySupportsStencilFeedback;
}

- (BOOL)familySupportsFP32TessFactors
{
  return self->_familySupportsFP32TessFactors;
}

- (BOOL)familySupportsUnalignedVertexFetch
{
  return self->_familySupportsUnalignedVertexFetch;
}

- (BOOL)familySupportsExtendedVertexFormats
{
  return self->_familySupportsExtendedVertexFormats;
}

- (BOOL)familySupportsResourceDetachBacking
{
  return self->_familySupportsResourceDetachBacking;
}

- (BOOL)familySupportsBufferWithAddressRanges
{
  return self->_familySupportsBufferWithAddressRanges;
}

- (BOOL)familySupportsHeapWithAddressRanges
{
  return self->_familySupportsHeapWithAddressRanges;
}

- (BOOL)familySupportsSIMDGroup
{
  return self->_familySupportsSIMDGroup;
}

- (BOOL)familySupportsShaderMinLODClamp
{
  return self->_familySupportsShaderMinLODClamp;
}

- (BOOL)familySupportsSIMDShufflesAndBroadcast
{
  return self->_familySupportsSIMDShufflesAndBroadcast;
}

- (BOOL)familySupportsWritableArrayOfTextures
{
  return self->_familySupportsWritableArrayOfTextures;
}

- (BOOL)familySupportsVariableRateRasterization
{
  return self->_familySupportsVariableRateRasterization;
}

- (BOOL)familySupportsYCBCRFormats
{
  return self->_familySupportsYCBCRFormats;
}

- (BOOL)familySupportsYCBCRFormatsPQ
{
  return self->_familySupportsYCBCRFormatsPQ;
}

- (BOOL)familySupportsYCBCRFormats12
{
  return self->_familySupportsYCBCRFormats12;
}

- (BOOL)familySupportsYCBCRFormatsXR
{
  return self->_familySupportsYCBCRFormatsXR;
}

- (BOOL)familySupportsASTCHDRTextureCompression
{
  return self->_familySupportsASTCHDRTextureCompression;
}

- (BOOL)familySupportsSparseTextures
{
  return self->_familySupportsSparseTextures;
}

- (BOOL)familySupportsSparseHeaps
{
  return self->_familySupportsSparseHeaps;
}

- (BOOL)familySupportsIndirectWritableTextures
{
  return self->_familySupportsIndirectWritableTextures;
}

- (BOOL)familySupportsFunctionPointers
{
  return self->_familySupportsFunctionPointers;
}

- (BOOL)familySupportsDynamicLibraries
{
  return self->_familySupportsDynamicLibraries;
}

- (BOOL)familySupportsStatefulDynamicLibraries
{
  return self->_familySupportsStatefulDynamicLibraries;
}

- (BOOL)familySupportsRenderDynamicLibraries
{
  return self->_familySupportsRenderDynamicLibraries;
}

- (BOOL)familySupportsFunctionPointersFromRender
{
  return self->_familySupportsFunctionPointersFromRender;
}

- (BOOL)familySupportsSharedFunctionTables
{
  return self->_familySupportsSharedFunctionTables;
}

- (BOOL)familySupportsRaytracingFromRender
{
  return self->_familySupportsRaytracingFromRender;
}

- (BOOL)familySupportsPrimitiveMotionBlur
{
  return self->_familySupportsPrimitiveMotionBlur;
}

- (BOOL)familySupportsRayTracingExtendedVertexFormats
{
  return self->_familySupportsRayTracingExtendedVertexFormats;
}

- (BOOL)familySupportsHeapAccelerationStructureAllocation
{
  return self->_familySupportsHeapAccelerationStructureAllocation;
}

- (BOOL)familySupportsRayTracingPerPrimitiveData
{
  return self->_familySupportsRayTracingPerPrimitiveData;
}

- (BOOL)familySupportsRayTracingTraversalMetrics
{
  return self->_familySupportsRayTracingTraversalMetrics;
}

- (BOOL)familySupportsRayTracingBuffersFromTables
{
  return self->_familySupportsRayTracingBuffersFromTables;
}

- (BOOL)familySupportsRayTracingAccelerationStructureCPUDeserialization
{
  return self->_familySupportsRayTracingAccelerationStructureCPUDeserialization;
}

- (BOOL)familySupportsRayTracingMultiLevelInstancing
{
  return self->_familySupportsRayTracingMultiLevelInstancing;
}

- (BOOL)familySupportsRayTracingIndirectInstanceAccelerationStructureBuild
{
  return self->_familySupportsRayTracingIndirectInstanceAccelerationStructureBuild;
}

- (BOOL)familySupportsRayTracingGPUTableUpdateBuffers
{
  return self->_familySupportsRayTracingGPUTableUpdateBuffers;
}

- (BOOL)familySupportsRayTracingCurves
{
  return self->_familySupportsRayTracingCurves;
}

- (BOOL)familySupportsShaderBarycentricCoordinates
{
  return self->_familySupportsShaderBarycentricCoordinates;
}

- (BOOL)familySupportsBlackOrWhiteSamplerBorderColors
{
  return self->_familySupportsBlackOrWhiteSamplerBorderColors;
}

- (BOOL)familySupportsMirrorClampToEdgeSamplerMode
{
  return self->_familySupportsMirrorClampToEdgeSamplerMode;
}

- (BOOL)familySupportsSIMDReduction
{
  return self->_familySupportsSIMDReduction;
}

- (BOOL)familySupportsDepthClipModeClampExtended
{
  return self->_familySupportsDepthClipModeClampExtended;
}

- (BOOL)familySupportsTexture2DMultisampleArray
{
  return self->_familySupportsTexture2DMultisampleArray;
}

- (BOOL)familySupportsForceSeamsOnCubemaps
{
  return self->_familySupportsForceSeamsOnCubemaps;
}

- (BOOL)familySupportsFloat16BCubicFiltering
{
  return self->_familySupportsFloat16BCubicFiltering;
}

- (BOOL)familySupportsFloat16InfNanFiltering
{
  return self->_familySupportsFloat16InfNanFiltering;
}

- (BOOL)familySupportsRTZRounding
{
  return self->_familySupportsRTZRounding;
}

- (BOOL)familySupportsAnisoSampleFix
{
  return self->_familySupportsAnisoSampleFix;
}

- (BOOL)familySupportsYCBCRPackedFormatsPQ
{
  return self->_familySupportsYCBCRPackedFormatsPQ;
}

- (BOOL)familySupportsYCBCRPackedFormats12
{
  return self->_familySupportsYCBCRPackedFormats12;
}

- (BOOL)familySupportsYCBCRPackedFormatsXR
{
  return self->_familySupportsYCBCRPackedFormatsXR;
}

- (BOOL)familySupportsBufferBoundsChecking
{
  return self->_familySupportsBufferBoundsChecking;
}

- (BOOL)familySupportsForkJoin
{
  return self->_familySupportsForkJoin;
}

- (BOOL)familySupportsDevicePartitioning
{
  return self->_familySupportsDevicePartitioning;
}

- (BOOL)familySupportsComputeCompressedTextureWrite
{
  return self->_familySupportsComputeCompressedTextureWrite;
}

- (BOOL)familySupportsSIMDGroupMatrix
{
  return self->_familySupportsSIMDGroupMatrix;
}

- (BOOL)familySupportsInterchangeTiled
{
  return self->_familySupportsInterchangeTiled;
}

- (BOOL)familySupportsQuadReduction
{
  return self->_familySupportsQuadReduction;
}

- (BOOL)familySupportsVirtualSubstreams
{
  return self->_familySupportsVirtualSubstreams;
}

- (BOOL)familySupportsSIMDShuffleAndFill
{
  return self->_familySupportsSIMDShuffleAndFill;
}

- (BOOL)familySupportsBfloat16Format
{
  return self->_familySupportsBfloat16Format;
}

- (BOOL)familySupportsSparseDepthAttachments
{
  return self->_familySupportsSparseDepthAttachments;
}

- (BOOL)familySupportsAtomicUlongVoidMinMax
{
  return self->_familySupportsAtomicUlongVoidMinMax;
}

- (BOOL)familySupportsLossyCompression
{
  return self->_familySupportsLossyCompression;
}

- (BOOL)familySupportsMeshShaders
{
  return self->_familySupportsMeshShaders;
}

- (BOOL)familySupportsFunctionPointersFromMesh
{
  return self->_familySupportsFunctionPointersFromMesh;
}

- (BOOL)familySupportsMeshShadersInICB
{
  return self->_familySupportsMeshShadersInICB;
}

- (BOOL)familySupportsMeshRenderDynamicLibraries
{
  return self->_familySupportsMeshRenderDynamicLibraries;
}

- (BOOL)familySupportsBfloat16Buffers
{
  return self->_familySupportsBfloat16Buffers;
}

- (BOOL)familySupportsCommandBufferJump
{
  return self->_familySupportsCommandBufferJump;
}

- (BOOL)familySupportsColorSpaceConversionMatrixSelection
{
  return self->_familySupportsColorSpaceConversionMatrixSelection;
}

- (BOOL)familySupportsPerPlaneCompression
{
  return self->_familySupportsPerPlaneCompression;
}

- (BOOL)familySupportsConditionalLoadStore
{
  return self->_familySupportsConditionalLoadStore;
}

- (BOOL)familySupportsStackOverflowErrorCode
{
  return self->_familySupportsStackOverflowErrorCode;
}

- (BOOL)familySupportsRayTracingICBs
{
  return self->_familySupportsRayTracingICBs;
}

- (BOOL)familySupportsPerformanceStateAssertion
{
  return self->_familySupportsPerformanceStateAssertion;
}

- (BOOL)familySupportsExplicitVisibilityGroups
{
  return self->_familySupportsExplicitVisibilityGroups;
}

- (BOOL)familySupportsRayTracingMatrixLayout
{
  return self->_familySupportsRayTracingMatrixLayout;
}

- (BOOL)familySupportsRayTracingDirectIntersectionResultAccess
{
  return self->_familySupportsRayTracingDirectIntersectionResultAccess;
}

- (BOOL)familySupportsRayTracingPerComponentMotionInterpolation
{
  return self->_familySupportsRayTracingPerComponentMotionInterpolation;
}

- (BOOL)familySupportsExtendedSamplerLODBiasRange
{
  return self->_familySupportsExtendedSamplerLODBiasRange;
}

- (BOOL)familySupportsDeviceCoherency
{
  return self->_familySupportsDeviceCoherency;
}

@end
