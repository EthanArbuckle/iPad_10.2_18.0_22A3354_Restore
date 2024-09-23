@implementation GEOAltitudeManifestReserved

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 1) = (char *)self + 16;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservedIsolater, 0);
  std::__tree<std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,_GEOAltitudeTriggerData>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,_GEOAltitudeTriggerData>>>::destroy((_QWORD *)self->_reservedTriggerData.__tree_.__pair1_.__value_.__left_);
}

@end
