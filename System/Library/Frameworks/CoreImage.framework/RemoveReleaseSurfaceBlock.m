@implementation RemoveReleaseSurfaceBlock

uint64_t __RemoveReleaseSurfaceBlock_block_invoke(CI *a1)
{
  uint64_t v2;
  dispatch_object_t *v3;
  CI *v4;
  _QWORD *v5;
  _QWORD *v6;
  dispatch_object_t v7;
  CI *v8;
  unint64_t v9;
  BOOL v10;
  _QWORD *v11;
  uint64_t result;
  CI *v13;
  uint64_t v14;

  v2 = CI::gReleaseSurfaceBlockMap(a1);
  v3 = (dispatch_object_t *)((char *)a1 + 32);
  v6 = *(_QWORD **)(v2 + 8);
  v4 = (CI *)(v2 + 8);
  v5 = v6;
  if (!v6)
    goto LABEL_12;
  v7 = *v3;
  v8 = v4;
  do
  {
    v9 = v5[4];
    v10 = v9 >= (unint64_t)v7;
    if (v9 >= (unint64_t)v7)
      v11 = v5;
    else
      v11 = v5 + 1;
    if (v10)
      v8 = (CI *)v5;
    v5 = (_QWORD *)*v11;
  }
  while (*v11);
  if (v8 == v4 || (unint64_t)v7 < *((_QWORD *)v8 + 4))
LABEL_12:
    v8 = v4;
  result = CI::gReleaseSurfaceBlockMap(v4);
  if (v8 != (CI *)(result + 8))
  {
    _Block_release(*((const void **)v8 + 5));
    dispatch_release(*v3);
    v14 = CI::gReleaseSurfaceBlockMap(v13);
    return std::__tree<std::__value_type<dispatch_queue_s *,void({block_pointer})(__IOSurface *)>,std::__map_value_compare<dispatch_queue_s *,std::__value_type<dispatch_queue_s *,void({block_pointer})(__IOSurface *)>,std::less<dispatch_queue_s *>,true>,std::allocator<std::__value_type<dispatch_queue_s *,void({block_pointer})(__IOSurface *)>>>::__erase_unique<dispatch_queue_s *>(v14, (unint64_t *)v3);
  }
  return result;
}

@end
