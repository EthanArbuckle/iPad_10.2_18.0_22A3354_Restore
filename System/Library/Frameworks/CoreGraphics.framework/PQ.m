@implementation PQ

uint64_t *__color_space_state_create_p3_PQ_block_invoke_2()
{
  uint64_t *result;
  uint64_t v1;

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t *)CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle
    && (result = (uint64_t *)dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "kColorSyncDisplayP3_PQProfile")) != 0)
  {
    v1 = *result;
  }
  else
  {
    v1 = 0;
  }
  color_space_state_create_p3_PQ_s = v1;
  return result;
}

uint64_t *__color_space_state_create_itur_2100_PQ_block_invoke_2()
{
  uint64_t *result;
  uint64_t v1;

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t *)CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle
    && (result = (uint64_t *)dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "kColorSyncITUR2100_PQProfile")) != 0)
  {
    v1 = *result;
  }
  else
  {
    v1 = 0;
  }
  color_space_state_create_itur_2100_PQ_s = v1;
  return result;
}

uint64_t (*__color_space_state_create_p3_PQ_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreateWithName");
  v1 = colorsync_smart_null_1622;
  if (result)
    v1 = result;
  color_space_state_create_p3_PQ_f = v1;
  return result;
}

uint64_t (*__color_space_state_create_itur_2100_PQ_block_invoke())()
{
  uint64_t (*result)();
  uint64_t (*v1)();

  if (CGLibraryLoadColorSyncDYLD_once != -1)
    dispatch_once(&CGLibraryLoadColorSyncDYLD_once, &__block_literal_global_19700);
  result = (uint64_t (*)())CGLibraryLoadColorSyncDYLD_handle;
  if (CGLibraryLoadColorSyncDYLD_handle)
    result = (uint64_t (*)())dlsym((void *)CGLibraryLoadColorSyncDYLD_handle, "ColorSyncProfileCreateWithName");
  v1 = colorsync_smart_null_1622;
  if (result)
    v1 = result;
  color_space_state_create_itur_2100_PQ_f = v1;
  return result;
}

@end
