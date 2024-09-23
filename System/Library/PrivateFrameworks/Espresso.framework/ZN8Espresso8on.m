@implementation ZN8Espresso8on

uint64_t **___ZN8Espresso8on_allocEPvm_block_invoke_2(uint64_t **a1)
{
  unint64_t v2;
  uint64_t **SizesPerPointer;
  uint64_t **result;

  v2 = ((unint64_t)a1[4] + 4095) & 0xFFFFFFFFFFFFF000;
  Espresso::allocated_memory += v2;
  SizesPerPointer = (uint64_t **)Espresso::getSizesPerPointer((Espresso *)a1);
  result = std::__tree<std::__value_type<void *,unsigned long>,std::__map_value_compare<void *,std::__value_type<void *,unsigned long>,std::less<void *>,true>,std::allocator<std::__value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>(SizesPerPointer, (unint64_t)a1[5], a1 + 5);
  result[5] = (uint64_t *)v2;
  if (Espresso::allocated_memory > (unint64_t)Espresso::max_allocated_memory)
    Espresso::max_allocated_memory = Espresso::allocated_memory;
  return result;
}

@end
