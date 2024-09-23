@implementation CoordinateTuple

- (_HKAnnotatedHorizontalLineBlockCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (_HKAnnotatedHorizontalLineBlockCoordinate)originalCoordinate
{
  return self->_originalCoordinate;
}

- (void)setOriginalCoordinate:(id)a3
{
  objc_storeStrong((id *)&self->_originalCoordinate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalCoordinate, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);
}

@end
