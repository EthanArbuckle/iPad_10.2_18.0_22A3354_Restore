@implementation C3DShaderGetStandardUniforms

void __C3DShaderGetStandardUniforms_block_invoke()
{
  C3DShaderGetStandardUniforms_s_standardUniforms = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 20, MEMORY[0x1E0C9B390], 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_time"), (uint64_t)CFSTR("float"), 0, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_inverseResolution"), (uint64_t)CFSTR("vec2"), 1, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_modelTransform"), (uint64_t)CFSTR("mat4"), 2, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_inverseModelTransform"), (uint64_t)CFSTR("mat4"), 3, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_modelViewTransform"), (uint64_t)CFSTR("mat4"), 4, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_inverseModelViewTransform"), (uint64_t)CFSTR("mat4"), 5, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_normalTransform"), (uint64_t)CFSTR("mat4"), 6, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_modelViewProjectionTransform"), (uint64_t)CFSTR("mat4"), 7, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_inverseModelViewProjectionTransform"), (uint64_t)CFSTR("mat4"), 8, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_boundingBox"), (uint64_t)CFSTR("mat2x3"), 10, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_worldBoundingBox"), (uint64_t)CFSTR("mat2x3"), 11, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_viewTransform"), (uint64_t)CFSTR("mat4"), 12, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_inverseViewTransform"), (uint64_t)CFSTR("mat4"), 13, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_projectionTransform"), (uint64_t)CFSTR("mat4"), 14, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_inverseProjectionTransform"), (uint64_t)CFSTR("mat4"), 15, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_cameraPosition"), (uint64_t)CFSTR("vec3"), 17, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("u_viewToCubeWorld"), (uint64_t)CFSTR("mat4"), 16, 0, 1);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.time"), (uint64_t)CFSTR("float"), 0, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.invScreenPixelSize"), (uint64_t)CFSTR("float2"), 1, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.modelTransform"), (uint64_t)CFSTR("float4x4"), 2, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.inverseModelTransform"), (uint64_t)CFSTR("float4x4"), 3, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.modelViewTransform"), (uint64_t)CFSTR("float4x4"), 4, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.inverseModelViewTransform"), (uint64_t)CFSTR("float4x4"), 5, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.normalTransform"), (uint64_t)CFSTR("float4x4"), 6, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.modelViewProjectionTransform"), (uint64_t)CFSTR("float4x4"), 7, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.inverseModelViewProjectionTransform"), (uint64_t)CFSTR("float4x4"), 8, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.boundingBox"), (uint64_t)CFSTR("float2x3"), 10, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_node.worldBoundingBox"), (uint64_t)CFSTR("float2x3"), 11, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.viewTransform"), (uint64_t)CFSTR("float4x4"), 12, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.inverseViewTransform"), (uint64_t)CFSTR("float4x4"), 13, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.projectionTransform"), (uint64_t)CFSTR("float4x4"), 14, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.inverseProjectionTransform"), (uint64_t)CFSTR("float4x4"), 15, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.cameraPosition"), (uint64_t)CFSTR("float3"), 17, 0, 0);
  C3DShaderAddStandardUniform((const __CFDictionary *)C3DShaderGetStandardUniforms_s_standardUniforms, CFSTR("scn_frame.viewToCubeWorld"), (uint64_t)CFSTR("float4x4"), 16, 0, 0);
}

@end
